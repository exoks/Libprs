//  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣦⣴⣶⣾⣿⣶⣶⣶⣶⣦⣤⣄⠀⠀⠀⠀⠀⠀⠀                                              
//  ⠀⠀⠀⠀⠀⠀⠀⢠⡶⠻⠛⠟⠋⠉⠀⠈⠤⠴⠶⠶⢾⣿⣿⣿⣷⣦⠄⠀⠀⠀      𓐓  KeyValueParser.tpp 𓐔           
//  ⠀⠀⠀⠀⠀⢀⠔⠋⠀⠀⠤⠒⠒⢲⠀⠀⠀⢀⣠⣤⣤⣬⣽⣿⣿⣿⣷⣄⠀⠀                                              
//  ⠀⠀⠀⣀⣎⢤⣶⣾⠅⠀⠀⢀⡤⠏⠀⠀⠀⠠⣄⣈⡙⠻⢿⣿⣿⣿⣿⣿⣦⠀      Dev: oezzaou <oussama.ezzaou@gmail.com> 
//  ⢀⠔⠉⠀⠊⠿⠿⣿⠂⠠⠢⣤⠤⣤⣼⣿⣶⣶⣤⣝⣻⣷⣦⣍⡻⣿⣿⣿⣿⡀                                              
//  ⢾⣾⣆⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠉⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇                                              
//  ⠀⠈⢋⢹⠋⠉⠙⢦⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇       Created: 2024/04/03 16:52:20 by oezzaou
//  ⠀⠀⠀⠑⠀⠀⠀⠈⡇⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇       Updated: 2025/03/02 08:59:41 by oezzaou
//  ⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⢀⣾⣿⣿⠿⠟⠛⠋⠛⢿⣿⣿⠻⣿⣿⣿⣿⡿⠀                                              
//  ⠀⠀⠀⠀⠀⠀⠀⢀⠇⠀⢠⣿⣟⣭⣤⣶⣦⣄⡀⠀⠀⠈⠻⠀⠘⣿⣿⣿⠇⠀                                              
//  ⠀⠀⠀⠀⠀⠱⠤⠊⠀⢀⣿⡿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠘⣿⠏⠀⠀                             𓆩♕𓆪      
//  ⠀⠀⠀⠀⠀⡄⠀⠀⠀⠘⢧⡀⠀⠀⠸⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠐⠋⠀⠀⠀                     𓄂 oussama ezzaou𓆃  
//  ⠀⠀⠀⠀⠀⠘⠄⣀⡀⠸⠓⠀⠀⠀⠠⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                                              

//====< constructor >===========================================================
template <class p1, class p2, char sep>
KeyValueParser<p1, p2, sep>::KeyValueParser(void)
{
}

//====< constructor >===========================================================
template <class p1, class p2, char sep>
KeyValueParser<p1, p2, sep>::KeyValueParser(std::fstream fileStream)
{
	if (fileStream == NULL)
		throw (Exception("Stream Error: Could not open file."));
	this->fileStream = fileStream;
}

//====< constructor >===========================================================
template <class p1, class p2, char sep>
KeyValueParser<p1, p2, sep>::KeyValueParser(std::string fileName)
{
	fileStream.open(fileName, std::ios::in);
	if (fileStream == NULL)
		throw (Exception("Stream Error: Could not open file."));
}

//====< destructor >============================================================
template <class p1, class p2, char sep>
KeyValueParser<p1, p2, sep>::~KeyValueParser(void)
{
	fileStream.close();
}

//====< parseNextLine >=========================================================
template <class p1, class p2, char sep>
std::pair<p1, p2>	KeyValueParser<p1, p2, sep>::parseNextLine(void)
{
	std::stringstream	ssk(""), ssv("");
	std::string       line, sKey, sValue;
	p1					      key;
	p2					      value;
	
	ssk >> key;
	ssv >> value;
	while (fileStream.eof() == false)
	{
		line = getNextLine(fileStream);
		if (line.empty() || fileStream.eof())
			continue ;
		std::stringstream	sline(line);
		getline(sline, sKey, sep);
		getline(sline, sValue, '\n');
		key = parse(key, sKey);
		value = parse(value, sValue);
		return (std::pair<p1, p2>(key, value));
	}
	return (std::pair<p1, p2>(key, value));
}

//====< parseFile >=============================================================
template <class p1, class p2, char sep>
std::map<p1, p2>	KeyValueParser<p1, p2, sep>::parseFile(void)
{
	std::map<p1, p2>	map;
	std::pair<p1, p2>	pair;

	while (fileStream)
	{
		pair = parseNextLine();
		if (fileStream.eof() == true)
			break ;
		map.insert(pair);
	}
	return (map);
}

//====< skipLine >==============================================================
template <class p1, class p2, char sep>
std::string	KeyValueParser<p1, p2, sep>::skipLine(void)
{
	return (getNextLine(fileStream));
}

//====< eof >===================================================================
template <class p1, class p2, char sep>
bool	KeyValueParser<p1, p2, sep>::eof(void)
{
	return (fileStream.eof());
}
