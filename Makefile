#  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣦⣴⣶⣾⣿⣶⣶⣶⣶⣦⣤⣄⠀⠀⠀⠀⠀⠀⠀                                              
#  ⠀⠀⠀⠀⠀⠀⠀⢠⡶⠻⠛⠟⠋⠉⠀⠈⠤⠴⠶⠶⢾⣿⣿⣿⣷⣦⠄⠀⠀⠀                𓐓  Makefile 𓐔           
#  ⠀⠀⠀⠀⠀⢀⠔⠋⠀⠀⠤⠒⠒⢲⠀⠀⠀⢀⣠⣤⣤⣬⣽⣿⣿⣿⣷⣄⠀⠀                                              
#  ⠀⠀⠀⣀⣎⢤⣶⣾⠅⠀⠀⢀⡤⠏⠀⠀⠀⠠⣄⣈⡙⠻⢿⣿⣿⣿⣿⣿⣦⠀      Dev: oezzaou <oussama.ezzaou@gmail.com> 
#  ⢀⠔⠉⠀⠊⠿⠿⣿⠂⠠⠢⣤⠤⣤⣼⣿⣶⣶⣤⣝⣻⣷⣦⣍⡻⣿⣿⣿⣿⡀                                              
#  ⢾⣾⣆⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠉⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇                                              
#  ⠀⠈⢋⢹⠋⠉⠙⢦⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇       Created: 2023/12/13 18:56:44 by oezzaou
#  ⠀⠀⠀⠑⠀⠀⠀⠈⡇⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇       Updated: 2025/02/28 11:21:15 by oezzaou
#  ⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⢀⣾⣿⣿⠿⠟⠛⠋⠛⢿⣿⣿⠻⣿⣿⣿⣿⡿⠀                                              
#  ⠀⠀⠀⠀⠀⠀⠀⢀⠇⠀⢠⣿⣟⣭⣤⣶⣦⣄⡀⠀⠀⠈⠻⠀⠘⣿⣿⣿⠇⠀                                              
#  ⠀⠀⠀⠀⠀⠱⠤⠊⠀⢀⣿⡿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠘⣿⠏⠀⠀                             𓆩♕𓆪      
#  ⠀⠀⠀⠀⠀⡄⠀⠀⠀⠘⢧⡀⠀⠀⠸⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠐⠋⠀⠀⠀                     𓄂 oussama ezzaou𓆃  
#  ⠀⠀⠀⠀⠀⠘⠄⣀⡀⠸⠓⠀⠀⠀⠠⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                                              

#====<[ CC compiler: ]>=========================================================
CC					:= c++
CPPFLAGS		:= -Wall -Wextra -Werror -std=c++98
RM					:= rm -rf

#====<[ Sources: ]>=============================================================
PROJECT			:= ParserLib
STATIC_LIB	:= libprs.a
SHARED_LIB	:= libprs.so

OBJ_DIR			:= obj
SRC_DIR			:= src
INCLUDE			:= -Iinclude

SRC					:= $(wildcard */*.cpp)
OBJ					:= $(patsubst %.cpp, $(OBJ_DIR)/%.o, $(notdir $(SRC)))

#====<[ Colors: ]>==============================================================
GREEN					= \033[1;32m
RED						= \033[1;31m
BLUE					= \033[34m
CYAN					= \033[1;36m
GRAY					= \033[0;90m
PURPLE				= \033[0;35m
YELLOW				= \033[0;93m
BLACK  				= \033[20m
MAGENTA 			= \033[35m
WHITE  				= \033[37m
PINK					= \033[0;38;5;199m
ORANGE 				= \033[38;5;214m
LIGHT_BLACK  	= \033[90m
LIGHT_RED    	= \033[91m
LIGHT_GREEN  	= \033[92m
LIGHT_YELLOW 	= \033[93m
LIGHT_BLUE   	= \033[94m
LIGHT_MAGENTA = \033[95m
LIGHT_CYAN   	= \033[96m
LIGHT_WHITE  	= \033[97m
LIGHT_BLUE		= \033[38;5;45m
RESET					= \033[1;0m

#====<[ rules: ]>===============================================================
all: static 

static: signature $(static_lib)

shared: signature $(shared_lib)

$(static_lib): $(obj)
	@ar rcs $@ $^  
	@test | awk '\
		begin {\
		for (i=0; i < 70; i++){\
			printf("$(green)▇$(end)");\
			system("sleep 0.01");\
		}\
	} end{printf "\n"}'
	@echo "${green}[ok] ${cyan}$(static_lib) ✔️${reset}"

$(shared_lib): $(obj)
	@$(cc) $(cppflags) -shared -o $@ $^  
	@test | awk '\
		begin {\
		for (i=0; i < 70; i++){\
			printf("$(green)▇$(end)");\
			system("sleep 0.01");\
		}\
	} end{printf "\n"}'
	@echo "${green}[ok] ${cyan}$(shared_lib) ✔️${reset}"

signature:
	@printf "${gray}%19s${reset}\n"	"𓆩♕𓆪"
	@printf "${gray}%s${reset}\n"		"𓄂 oussama ezzaou"

$(obj_dir)/%.o: $(src_dir)/%.cpp | .create_dir 
	@$(cc) $(cppflags) $(include) -fpic -c $< -o $@
	@printf "$(green)[ok]${reset} ${pink}compiling${reset} %-33s| $@\n" "$<"

$(obj_dir):
	@mkdir -p $@

clean:
	@if [ -d $(obj_dir) ]; then\
		${rm} $(obj_dir);\
		printf "${green}[ok]${reset} ${orange}cleaning  %-33s${reset}| ./%s\n"\
					 "... " "$(project)/$(obj_dir) ✔️";\
	else\
		printf "${red}[ko]${reset} ${blue}not found %-33s${reset}| ./%s\n"\
					 "..." "$(project)/$(obj_dir) ✖️";\
	fi

fclean: clean
	@if [ -f $(static_lib) ]; then\
		${rm} $(static_lib);\
		printf "${green}[ok]${reset} ${orange}cleaning  %-33s${reset}| ./%s\n"\
				 "... " "$(project)/$(static_lib) ✔️";\
	elif [ ! -f $(static_lib) ]; then\
		printf "${red}[ko]${reset} ${blue}not found %-33s${reset}| ./%s\n"\
					 "..." "$(project)/$(static_lib) ✖️";\
	fi
	@if [ -f $(shared_lib) ]; then\
		${rm} $(shared_lib);\
		printf "${green}[ok]${reset} ${orange}cleaning  %-33s${reset}| ./%s\n"\
				 "... " "$(project)/$(shared_lib) ✔️";\
	elif [ ! -f $(shared_lib) ]; then\
		printf "${red}[ko]${reset} ${blue}not found %-33s${reset}| ./%s\n"\
					 "..." "$(project)/$(shared_lib) ✖️";\
	fi

re: fclean all

.create_dir: $(obj_dir)

.suffixes: .o .cpp .tpp .a .so 

.phony: all static shared clean fclean re signature
#===============================================================================
