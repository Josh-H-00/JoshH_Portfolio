from flask import Flask, render_template, request
from flask_mysqldb import MySQL
from pyngrok import ngrok

app = Flask(__name__)

http_tunnel = ngrok.connect(5000).public_url

import logging
from flask.logging import default_handler

logger = logging.getLogger()
logger.addHandler(default_handler)
log = logging.getLogger('werkzeug')
log.disabled = False

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'root'
app.config['MYSQL_DB'] = 'DnD'

mysql = MySQL(app)

def remove_arrow(s :str) -> str:
  if s[-1] == '▼':
    s = s[:len(s)-2]
  return s

def get_field_index(cursor, field_name):
  fields = get_fields(cursor)
  return fields.index(field_name)

def get_select_string(table : str, columns : tuple = (), entry_cond : tuple = ()):
  if len(columns) == 0:
    columns = ('*')
  exec_str =  'SELECT ' + ", ".join(columns) + ' FROM ' + table
  
  if len(entry_cond) != 0:
    for a in range(len(entry_cond)):
      temp = entry_cond[a].split(" ")
      or_ops = temp[2].split("/")
        
      out_cond = []
      
      for b in or_ops:
          
        if temp[1] == 'BEGINS':
          if b[0] != '"':
            b = '"' + b
          if b[-1] != '"':
            b = b + '"'
            
          out_cond.append(temp[0] + " " + ("REGEXP") + " " + ("'^[" + b +"].*$'"))
        elif temp[1] == 'CONTAINS':
          if b[0] == '"':
            b = b[1:]
          if b[-1] == '"':
            b = b[:len(b)-1]
            
          out_cond.append(temp[0] + " " + ("LIKE") + " " + ("'%" + b +"%'"))
        else:
          out_cond.append(temp[0] + " " + temp[1] + " " + b)
      
      entry_cond[a] = " OR ".join(out_cond)
    
    exec_str += ' WHERE ' + ' AND '.join(entry_cond)
    print(exec_str)
  return exec_str

def get_insert_string(table : str, items : tuple):
  fields = get_fields_new(table)
  print("FIELDS: " + str(fields))
  
  for a in range(len(items)):
    if items[a][0] != '"':
      items[a] = '"' + items[a]
    if items[a][-1] != '"':
      items[a] = items[a] + '"'
  
  exec_str = "INSERT INTO " + table + ' (' + ','.join(fields) + ')' + " VALUES (" + ','.join(items) + ');'
  print("EXEC STRING: " + exec_str)
  return exec_str

def insert_entries(cursor, table : str, items : tuple):
  cursor.execute(get_insert_string(table, items))

def insert_entries_new(table : str, items : tuple):
  cursor = mysql.connection.cursor()
  insert_entries(cursor, table, items)


def get_fields(cursor) -> tuple:
  return tuple([i[0] for i in cursor.description])

def get_entries(cursor) -> tuple:
  return cursor.fetchall()
  
def get_entries_with_fields(cursor) -> tuple:
  data = get_entries(cursor)
  fields = get_fields(cursor),
  return fields + data

def get_fields_new(table : str, columns : str = '*', entry_cond : tuple = ()):
  cursor = mysql.connection.cursor()
  cursor.execute(get_select_string(table, columns, entry_cond))
  cursor.close()
  return get_fields(cursor)

def get_entries_new(table : str, columns : str = '*', entry_cond : tuple = ()):
  cursor = mysql.connection.cursor()
  cursor.execute(get_select_string(table, columns, entry_cond))
  cursor.close()
  return get_entries(cursor)

def get_entries_with_fields_new(table : str, columns : str = '*', entry_cond : tuple = ()):
  cursor = mysql.connection.cursor()
  cursor.execute(get_select_string(table, columns, entry_cond))

  return get_entries_with_fields(cursor)

def get_entries_sort(cursor, sort_var : str = 'default', reverse : bool = False):
  if sort_var == 'default':
    var_index = 0
  else:
    var_index = get_field_index(cursor, sort_var)
  
  data = list(get_entries(cursor))
  data.sort(key=lambda field: field[var_index], reverse=reverse)
  return tuple(data)

def get_entries_sort_new(table : str, sort_var : str = 'default', reverse : bool = False, columns : str = '*', entry_cond : tuple = ()):
  cursor = mysql.connection.cursor()
  cursor.execute(get_select_string(table, columns, entry_cond))
  
  return get_entries_sort(cursor, sort_var, reverse)

def get_entries_with_fields_sort(cursor, sort_var : str = 'default', reverse = False) -> tuple:
  data = get_entries_sort(cursor, sort_var, reverse)
  fields = list(get_fields(cursor))
  
  if sort_var == 'default':
    fields[0] = fields[0] + " ▼"
    
  else:
    for i in range(len(fields)):
      if fields[i] == sort_var:
        if reverse == False:
          fields[i] = fields[i] + "\n▼"
          break
        else:
          fields[i] = fields[i] + "\n▲"
          break
        
  fields = tuple(fields),
  return fields + data

def get_entries_with_fields_sort_new(table : str, sort_var : str, reverse = False, columns : str = '*', entry_cond : tuple = ()) -> tuple:
  cursor = mysql.connection.cursor()
  cursor.execute(get_select_string(table, columns, entry_cond))

  return get_entries_with_fields_sort(cursor, sort_var, reverse)

@app.route("/", methods = ['POST', 'GET'])
def landing():
  curr_page = ''
  data = (),
  
  if request.method == 'POST':
    curr_page = 'Monsters'
    if request.form.get('nav_button'):
      curr_page = request.form['nav_button']
    
    sort_var = 'default'
    if request.form.get('sort_select'):
      sort_var = request.form.get('sort_select')
    
    include_var = '*'
    if request.form.get('curr_columns'):
      include_var = [a for a in request.form.getlist('curr_columns') if a not in request.form.getlist('hide_checkbox')]
      
    reverse_sort = False
    if request.form.get('ascend_checkbox'):
      reverse_sort = True
    
    exclusion_rules = ()
    if request.form.get('exclusion_select'):
      selects = request.form.getlist('exclusion_select')
      operator = request.form.getlist('exclusion_op_select')
      input = request.form.getlist('exclusion_input')
      
      exclusion_rules = []
      for a in range(len(selects)):
        exclusion_rules.append(remove_arrow(selects[a])+" "+operator[a]+' "'+input[a]+'"')
      
      print(exclusion_rules)
    
    if request.form['nav_button'] == 'Monsters':
      if request.form.getlist('addItemInput'):
        insert_items = request.form.getlist('addItemInput')
        insert_entries_new('monster', insert_items)
      data = get_entries_with_fields_sort_new('monster', sort_var, reverse_sort, include_var, exclusion_rules)
      
    elif request.form['nav_button'] == 'Spells':
      if request.form.getlist('addItemInput'):
        insert_items = request.form.getlist('addItemInput')
        insert_entries_new('spell', insert_items)
      data = get_entries_with_fields_sort_new('spell', sort_var, reverse_sort, include_var, exclusion_rules)
      
    elif request.form['nav_button'] == 'Classes':
      if request.form.getlist('addItemInput'):
        insert_items = request.form.getlist('addItemInput')
        insert_entries_new('Class', insert_items)
      data = get_entries_with_fields_sort_new('Class', sort_var, reverse_sort, include_var, exclusion_rules)
      
    elif request.form['nav_button'] == 'Backgrounds':
      if request.form.getlist('addItemInput'):
        insert_items = request.form.getlist('addItemInput')
        insert_entries_new('Background', insert_items)
      data = get_entries_with_fields_sort_new('Background', sort_var, reverse_sort, include_var, exclusion_rules)
      
    elif request.form['nav_button'] == 'Conditions':
      if request.form.getlist('addItemInput'):
        insert_items = request.form.getlist('addItemInput')
        insert_entries_new('Condition_status', insert_items)
      data = get_entries_with_fields_sort_new('Condition_status', sort_var, reverse_sort, include_var, exclusion_rules)
      
    elif request.form['nav_button'] == 'Proficiencies':
      if request.form.getlist('Proficiency'):
        insert_items = request.form.getlist('addItemInput')
        insert_entries_new('Proficiency', insert_items)
      data = get_entries_with_fields_sort_new('Proficiency', sort_var, reverse_sort, include_var, exclusion_rules)
      
  else:
    data = get_entries_with_fields_sort_new('monster', 'Mon_Name')

  return render_template('landing.html', fields = data[0], data = data[1:], curr_page = curr_page)

@app.route("/request", methods = ['POST', 'GET'])
def main():
  s_term = request.form['Field to Search']
  data = get_entries_with_fields_sort_new(s_term, "CR", True, ("Mon_Name", "CR"), "CR>=1")
  return render_template('DBrequest.html', data=data, len = len(data) - 1, width = len(data[0]))
  
if __name__ == "__main__":
  import logging
  logging.basicConfig(filename='error.log',level=logging.DEBUG)
  
  print(http_tunnel)
  app.run()