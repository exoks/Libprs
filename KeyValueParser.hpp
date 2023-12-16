//            ################                                                  
//          ####################                                                
//        ########################                                              
//       #############+########### #                                            
//       ######-..        .+########      < KeyValueParser.hpp >                        
//       ####-..            ..+####                                             
//       ###-...             .-####                                             
//       ###...              ..+##    Student: oussama <oezzaou@student.1337.ma>
//        #-.++###.      -###+..##                                              
//        #....  ...   .-.  ....##       Created: 2023/12/16 19:40:40 by oussama
//     --.#.-#+## -..  -+ ##-#-.-...     Updated: 2023/12/16 19:44:30 by oussama
//      ---....... ..  ........... -                                            
//      -+#..     ..   .       .+-.                                             
//       .--.     .     .     ..+.                                              
//         -..    .+--.-.     ...                                               
//         +.... .-+#.#+.    ..-                                                
//          +...#####-++###-..-                                                 
//          #---..----+--.---+##                                                
//        ###-+--.... ....--+#####                                              
//  ##########--#-.......-#-###########      Made By Oussama Ezzaou <OEZZAOU> :)

#ifndef __KEYVALUEPARSER_HPP__
# define __KEYVALUEPARSER_HPP__

# include <iostream>
# include <string>
# include <fstream>
# include <map>

namespace	prs
{
	template <class p1, class p2, char sep = '|'>
	class	KeyValueParser
	{
		private:
			std::string	fileName;
			std::fstream	fs;

		public:
			KeyValueParser(void);
			KeyValueParser(std::fstream fs);
			KeyValueParser(std::string fileName);
			~KeyValueParser(void);
		
			std::map<p1, p2>	parseFile(void);
			std::pair<p1, p2>	parseNextLine(void);
	};

# include "KeyValueParser.tpp"
};

#endif /*__KEYVALUEPARSER_HPP__*/
