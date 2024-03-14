template <typename K, typename V>
int MyUnorderedMap<K, V>::hash (const K &key) const
{
  int retVal = 0;

  for (auto it = key.cbegin(); it != key.cend(); ++it)
    retVal += *it;

  return (retVal%reserved_size);
}

template <typename K, typename V>
MyUnorderedMap<K, V>::MyUnorderedMap()
{
}

template <typename K, typename V>
MyUnorderedMap<K, V>::~MyUnorderedMap()
{
  delete[] m_data;
}

template <typename K, typename V>
MyUnorderedMap<K, V>::MyUnorderedMap(const MyUnorderedMap<K, V> &source)
{
  (*this) = source;
}

template <typename K, typename V>
MyUnorderedMap<K, V>& MyUnorderedMap<K, V>::operator=(const MyUnorderedMap<K, V> &source)
{
  clear();

  data_size = source.data_size;
  reserved_size = source.reserved_size;

  reserve(reserved_size);

  for (int i = 0; i < reserved_size; i ++)
  {
    if (source.m_data[i] != MyPair<K, V>(MyPair<K, V>().first, 0))
      insert(source.m_data[i]);
  }
}

template <typename K, typename V>
V & MyUnorderedMap<K,  V>::at(const K &key)
{
  return find(key)->second;
}

template <typename K, typename V>
V & MyUnorderedMap<K, V>::operator[] (const K &key)
{
  try
  {
    if(reserved_size<1) throw std::out_of_range("Size cannot be zero.");
    return at(key);
  } catch (std::exception& e)
  {
    insert(MyPair<K, V>(key, 0));
    return at(key);
  }
}

template <typename K, typename V>
bool MyUnorderedMap<K, V>::empty() const
{
  return !data_size;
}

template <typename K, typename V>
int MyUnorderedMap<K, V>::size() const
{
  return data_size;
}

template <typename K, typename V>
void MyUnorderedMap<K, V>::clear()
{
  delete[] m_data;

  data_size = 0;
  reserved_size = 0;
}

template <typename K, typename V>
void MyUnorderedMap<K, V>::insert(const MyPair<K, V> &init_pair)
{
  if (++data_size > reserved_size*0.6)
    reserve((reserved_size==0)?1:reserved_size * 2);

  int ins_index = hash(init_pair.first);


  while(m_data[ins_index] != MyPair<K, V>(MyPair<K, V>().first, 0))
  {
    ins_index++;
    if (ins_index >= reserved_size)
      ins_index = 0;
  }

  m_data[ins_index] = init_pair;
}

template <typename K, typename V>
void MyUnorderedMap<K, V>::erase(const K &key)
{
  *(find(key)) = MyPair<K, V>(MyPair<K, V>().first, 0);
}

template <typename K, typename V>
MyPair<K, V> * MyUnorderedMap<K, V>::find(const K &key) const
{
  int get_index = hash(key);

  while (m_data[get_index].first != key)
  {
    if (++get_index >= reserved_size)
      get_index = 0;

    if ((m_data[get_index] == MyPair<K, V>(MyPair<K, V>().first, 0)) | (get_index == hash(key)))
      throw std::out_of_range("Key does not exist in the table.");
  }

  return &(m_data[get_index]);
}

template <typename K, typename V>
void MyUnorderedMap<K, V>::print() const
{
  for (int i = 0; i < reserved_size; i ++)
  {
    if (m_data[i].first != "")
      cout << "[" << m_data[i].first << "]=" << m_data[i].second << ((i==reserved_size-1)?(""):(",")) << endl;
  }
}

template <typename K, typename V>
int MyUnorderedMap<K, V>::count(const K &key) const
{
  int ret_val = 0;

  for (int i = 0; i < reserved_size; i ++)
  {
    if (m_data[i].first == key) ret_val ++;
  }

  return ret_val;
}

template <typename K, typename V>
void MyUnorderedMap<K, V>::reserve(int new_cap)
{

  int old_size = reserved_size;
  reserved_size = new_cap;

  MyPair<K, V> * data = new MyPair<K, V>[old_size];

  for (int i = 0; i < old_size; i ++)
    data[i] = m_data[i];

  delete[] m_data;

  m_data = new MyPair<K, V>[new_cap];

  for (int i = 0; i < old_size; i ++)
  {
    if (data[i] != MyPair<K, V>(MyPair<K, V>().first, 0))
      insert(data[i]);
  }

  delete[] data;

}

void get_virus_frequency(MyUnorderedMap<std::string, int> &in_tree)
{
  std::string word = "";

  while (std::cin >> word)
  {
    std::string subword = "";
    std::string lowerword = "";
    for (int i = 0; i < word.length(); i ++)
    {

      if ((word[i] == 95) || (word[i] > 47 && word[i] < 58) || (word[i] > 64 && word[i] < 91) | (word[i] > 96 && word[i] < 123))
      {
        subword += word[i];
        lowerword += tolower(word[i]);
      }
      else
      {
        if (lowerword.find("virus") != std::string::npos)
        {
          in_tree[subword] += 1;
        }
        subword="";
        lowerword="";
      }
    }
    if (lowerword.find("virus") != std::string::npos)
    {
      in_tree[subword] += 1;
    }
  }
}

template <typename K, typename V>
bool operator==(const MyPair<K, V>&lhs, const MyPair<K, V>& rhs)
{
  return (lhs.first == rhs.first && lhs.second == rhs.second);
}

template <typename K, typename V>
bool operator!=(const MyPair<K, V>& lhs, const MyPair<K, V>& rhs)
{
  return !(lhs == rhs);
}
