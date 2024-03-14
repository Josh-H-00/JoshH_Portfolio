# Joshua Hagstrom

token = ""
tokenQueue = []

err = "INVALID!\n"

outmessage = "CORRECT"

RELATION = ("<",">","=","#")
ADDOPERATOR = ("+", "-", "OR", "&")
MULOPERATOR = ("*", "/", "AND", "MOD", "DIV")

doPrint = False
doPrintImportant = False

# Class we can use for a Symbol Table - basically just a wrapper for a dictionary
class SymbolTable():
  def __init__(self):
    self.table = {}
  
  def __getitem__(self, key):
    if key in self.table.keys():
      return self.table[key]
    
    return False
  
  def __setitem__(self, key, value):
  
    if isKeyword(value):
      error("Expected identifier")
      
    self.table[key] = value
    return self.table[key]
  
  def getall(self):
    return self.table
  
  def symbols(self):
    return self.table.keys()
    
symbolTable = SymbolTable()

# Alters error message and kills the function stack - this ensure the
#   program stops when we hit invalid input
def error(s : str, append_token : bool = True) -> None:
  if doPrint:
    print('error')
  global err
  err += (s)
  if append_token:
    if token == ' ':
      err += ', reached end of file.'
    else:
      err += (', got "' + token + '"')
  raise Exception()

# Tries to get the next token - if no such token is available, sets token var to a
#   string that should match nothing
def getToken(func_name : str = "") -> None:
  if doPrint:
    print('getToken')
  global tokenQueue
  global token
  
  try:
    if not len(tokenQueue):
      tokenQueue = input().split()
    
    if doPrintImportant:
      print('GETTING TOKEN', tokenQueue[0], tokenQueue, func_name)
    
    token = tokenQueue.pop(0)
  except:
    if doPrintImportant:
      print('NO TOKEN', func_name)
    token = " "

# True if s is a digit in [0-9], false otherwise
def isDigit(s : str) -> bool:
  if doPrint:
    print('isDigit')
  try:
    int(s)
  except:
    return False
    
  return True

# True if s is in [a-zA-Z], false otherwise
def isAlpha(s : str) -> bool:
  if doPrint:
    print('isAlpha')
  return s in "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
  
# True if s is in [a-zA-Z0-9], false otherwise
def isAlphanum(s : str) -> bool:
  if doPrint:
    print('isAlphanum')
  return (isDigit(s) or isAlpha(s))

def isInteger(s : str) -> bool:
  if doPrint:
    print('isInteger')
  state = 0
  
  for a in range(len(s)):
    if state == 0:
      if (a == 0) and (s[a] in ("+","-")):
        state = 0
      elif isDigit(s[a]):
        state = 1
      else:
        return False
    elif state == 1:
      if isDigit(s[a]):
        state = 1
      else:
        return False
  
  if state != 1:
    return False
  return True

def isDecimal(s : str) -> bool:
  if doPrint:
    print('isDecimal')
  
  parts = s.split('.')
    
  if len(parts) == 2 and isInteger(parts[0]):
    for a in parts[1]:
      if not isDigit(a):
        break
    else:
      return True
  
  return False

def isString(s : str) -> bool:
  if doPrint:
    print('isString')
  for a in (0, -1):
    if s[a] != '"':
      return False
  
  for a in s[1:len(s) - 1]:
    if a in (" \t"):
      break
  else:
    return True
  
  return False
      
def isIdentifier(s : str) -> bool:
  if doPrint:
    print('isIdentifier')
  if isAlpha(s[0]) and not isKeyword(s):
    for a in s[1:]:
      if not isAlphanum(a):
        break
    else:
      return True
  
  return False

def isKeyword(s : str) -> bool:
  if doPrint:
    print('isKeyword')
  return ( s in ('PRINT', '.', '[', ']', '(', ')', ';', 'WHILE', 'IF') )

def Selector() -> None:
  if doPrint or doPrintImportant:
    print('Selector', token, tokenQueue)
  if token == ".":
    getToken('Selector')
    
    if isIdentifier(token) and symbolTable[token] not in ('function', 'procedure'):
      symbolTable[token] = 'variable'
      getToken('Selector')
      
    else:
      error(str(symbolTable[token][0].upper() + symbolTable[token][1:]) + ' "' + str(token) + '" used as variable.', False)
  elif token == '[':
    getToken('Selector')
    
    Expression()
    
    if token == ']':
      getToken('Selector')
    else:
      error('Expected "]"')
  else:
    error('Expected selector')

def Designator() -> None:
  if doPrint or doPrintImportant:
    print('Designator', token, tokenQueue)
  if isIdentifier(token) and symbolTable[token] not in ('function', 'procedure'):
    symbolTable[token] = 'variable'
    getToken('Designator')
    
    while token == '.' or token == '[':
      Selector()
      
  else:
    if symbolTable[token]:
      error(str(symbolTable[token][0].upper() + symbolTable[token][1:]) + ' "' + str(token) + '" used as variable.', False)
    else:
      error('Identifier expected')

def ParamSequence():
  if doPrint or doPrintImportant:
    print('ParamSequence', token, tokenQueue)
  if isIdentifier(token) and symbolTable[token] not in ('function', 'procedure'):
    symbolTable[token] = 'variable'
    getToken('ParamSequence')
    
    while token == ',':
      getToken('ParamSequence')
      
      if isIdentifier(token) and symbolTable[token] not in ('function', 'procedure'):
        symbolTable[token] = 'variable'
        getToken('ParamSequence')
      else:
        error('Expected identifier')
    
  else:
    if symbolTable[token]:
      error(str(symbolTable[token][0].upper() + symbolTable[token][1:]) + ' "' + str(token) + '" used as variable.', False)
    else:
      error('Identifier expected')

def FunctionCall():
  if doPrint or doPrintImportant:
    print('FunctionCall', token, tokenQueue)
  if isIdentifier(token) and symbolTable[token] == 'function':
    getToken('FunctionCall')
    
    if token == '(':
      getToken('FunctionCall')
    
      if token != ')':
        ParamSequence()
        
      if token == ')':
        getToken('FunctionCall')
      else:
        error('Expected ")"')
        
    else:
      error('Expected "("')
    
  else:
    if symbolTable[token]:
      error(str(symbolTable[token][0].upper() + symbolTable[token][1:]) + ' "' + str(token) + '" used as function.', False)
    else:
      error('Unknown function "' + token + '".', False)
    

def Expression() -> None:
  if doPrint or doPrintImportant:
    print('Expression', token, tokenQueue)
  SimpleExpression()
  
  if token in RELATION:
    getToken('Expression')
    SimpleExpression()

def SimpleExpression() -> None:
  if doPrint or doPrintImportant:
    print('SimpleExpression', token)
  Term()
  
  while (token in ADDOPERATOR):
    getToken('SimpleExpression')
    Term()

def Term() -> None:
  if doPrint or doPrintImportant:
    print('Term', token, tokenQueue)
  Factor()
  
  while(token in MULOPERATOR):
    getToken('Term')
    Factor()

def Factor() -> None:
  if doPrint or doPrintImportant:
    print('Factor', token)
    
  if isInteger(token): getToken('Factor')
  elif isDecimal(token): getToken('Factor')
  elif isString(token): getToken('Factor')
  elif token == '(':
    getToken('Factor')
    
    Expression()
    if token == ')':
      getToken('Factor')
    else:
      error('Expected ")"')
  elif token == '~':
    getToken('Factor')
    
    Factor()
  elif isIdentifier(token) and (symbolTable[token] == 'function' or (len(tokenQueue) and tokenQueue[0] == '(')):
    FunctionCall()
  elif isIdentifier(token) and symbolTable[token] not in ('function', 'procedure'):
    Designator()
  else:
    error("Identifier expected")

def Assignment() -> None:
  if doPrint or doPrintImportant:
    print('Assignment', token, tokenQueue)
    
  Designator()
  
  if token == ":=":
    getToken('Assignment')
    
    Expression()
  else:
    error("':=' expected")
    
def PrintStatement() -> None:
  if doPrint or doPrintImportant:
    print('PrintStatement', token, tokenQueue)
    
  if token == "PRINT":
    getToken('PrintStatement')
    
    if token == "(":
      getToken('PrintStatement')
      Expression()
      
      if token == ")":
        getToken('PrintStatement')
        
      else:
        error("Expected )")
    else:
      error("Expected (")
  else:
    error("Expected 'PRINT'")

def IfStatement():
  if doPrint or doPrintImportant:
    print('IfStatement', token, tokenQueue)
    
  if token == 'IF':
    getToken('IfStatement')
    
    Expression()
    
    if token == 'THEN':
      getToken('IfStatement')
      
      StatementSequence()
      
      if token == 'ELSE':
        getToken('IfStatement')
        
        StatementSequence()
      
      if token == 'ENDIF':
        getToken('IfStatement')
        
      else:
        error('Expected "ENDIF"')
    
    
  else:
    error('Expected "IF"')

def WhileStatement():
  if doPrint or doPrintImportant:
    print('WhileStatement', token, tokenQueue)
    
  if token == 'WHILE':
    getToken('WhileStatement')
    
    Expression()
    
    if token == 'DO':
      getToken('WhileStatement')
      
      StatementSequence()
      
      while token == 'ELSIF':
        getToken('WhileStatement')
        
        Expression()
    
        if token == 'DO':
          getToken('WhileStatement')
      
          StatementSequence()
        
        else:
          error('Expected "DO"')
        
      if token == 'ENDW':
        getToken('WhileStatement')
        
      else:
        error('Expected "ENDW"')
    else:
      error('Expected "DO"')
      
  else:
    error('Expected "WHILE"')

def ProcedureCall():
  if doPrint or doPrintImportant:
    print('ProcedureCall', token, tokenQueue)
    
  if symbolTable[token] == 'procedure':
    getToken('ProcedureCall')
      
    if token == '(':
      getToken('ProcedureCall')
        
      if token != ')':
        ParamSequence()
      
      if token == ')':
        getToken('ProcedureCall')
          
      else:
        error('Expected ")"')
    else:
      error('Expected "("')
  else:
    if symbolTable[token]:
      error(str(symbolTable[token][0].upper() + symbolTable[token][1:]) + ' "' + str(token) + '" used as procedure.', False)
    else:
      error('Undefined procedure "' + token + '".', False)
      

def Statement() -> None:
  if doPrint or doPrintImportant:
    print('Statement', token, tokenQueue)
    
  if ( token == "PRINT" ): PrintStatement()
  elif ( token == "IF" ): IfStatement()
  elif ( token == "WHILE" ): WhileStatement()
  elif ( isIdentifier ( token ) and (symbolTable[token] == 'variable' or (len(tokenQueue) and tokenQueue[0] == ':='))): Assignment()
  elif ( symbolTable[token] == 'procedure' or (len(tokenQueue) and tokenQueue[0] == '(')): ProcedureCall()
  else: error("Expected statement")

# START SYMBOL
def StatementSequence() -> None:
  if doPrint or doPrintImportant:
    print('StatementSequence', token, tokenQueue)
    
  Statement()
  
  while ( token == ";" ):
    getToken('StatementSequence')
    
    if token == ' ':
      getToken('StatementSequence')
    
    Statement()

def ProcedureBody():
  if doPrint or doPrintImportant:
    print('ProcedureBody', token, tokenQueue)
    
  if token == ';': getToken()
  else:
    StatementSequence()
    
    if token == 'END.':
      getToken('ProcedureBody')
    
    else:
      error('Expected "END."')

def ProcedureDeclaration():
  if doPrint or doPrintImportant:
    print('ProcedureDeclaration', token, tokenQueue)
    
  if token == 'PROCEDURE':
    getToken('ProcedureDeclaration')
      
    if isIdentifier(token) and not symbolTable[token]:
      symbolTable[token] = 'procedure'
      
      getToken('ProcedureDeclaration')
      
      if token == '(':
        getToken('ProcedureDeclaration')
        
        while token != ')':
          ParamSequence()
        
        if token == ')':
          getToken('ProcedureDeclaration')
          
          ProcedureBody()
          
        else:
          error('Expected ")"')
        
      else:
        error('Expected "("')
      
    else:
      error('Expected uninitialized identifier')
    
  else:
    error('Expected "PROCEDURE"')

def FunctionBody():
  if doPrint or doPrintImportant:
    print('FunctionBody', token, tokenQueue)
    
  if token == ';': pass
  else:
    StatementSequence()
    
    if token == 'END':
      getToken('FunctionBody')
      
      if token == 'RETURN':
        getToken('FunctionBody')
        
        if isIdentifier(token) and symbolTable[token] == 'variable':
          getToken('FunctionBody')
          
          if token == '.':
            getToken('FunctionBody')
          
          else:
            error('Expected "."')
      
      else:
        error('Expected "RETURN"')
    
    else:
      error('Expected "END"')

def FunctionDeclaration():
  if doPrint or doPrintImportant:
    print('FunctionDeclaration', token, tokenQueue)
    
  if token == 'FUNCTION':
    getToken('FunctionDeclaration')
      
    if isIdentifier(token) and not symbolTable[token]:
      symbolTable[token] = 'function'
      
      getToken('FunctionDeclaration')
      
      if token == '(':
        getToken('FunctionDeclaration')
        
        while token != ')':
          ParamSequence()
        
        if token == ')':
          getToken('FunctionDeclaration')
          
          FunctionBody()
          
        else:
          error('Expected ")"')
        
      else:
        error('Expected "("')
      
    else:
      error('Expected uninitialized identifier')
    
  else:
    error('Expected "FUNCTION"')

def NamedDeclaration():
  if doPrint or doPrintImportant:
    print('NamedDeclaration', token, tokenQueue)
    
  if token == 'PROCEDURE': ProcedureDeclaration()
  elif token == 'FUNCTION': FunctionDeclaration()
  else: error("Function or Procedure declaration expected")

def DeclarationSequence():
  if doPrint or doPrintImportant:
    print('DeclarationSequence', token, tokenQueue)
    
  NamedDeclaration()
  
  getToken('DeclarationSequence')
  
  while ( token != " "):
    NamedDeclaration()

getToken('Main')

#DeclarationSequence()

# This structure starts the parser. If input is invalid the function should throw an error
#   and print the error message.
try:
  DeclarationSequence()
except:
  print(err)
else:
  print(outmessage)
  print('Symbol Table : size', len(symbolTable.symbols()))
  for key in symbolTable.symbols():
    print(key, symbolTable[key])