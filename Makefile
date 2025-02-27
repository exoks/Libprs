#  ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣦⣴⣶⣾⣿⣶⣶⣶⣶⣦⣤⣄⠀⠀⠀⠀⠀⠀⠀                                              
#  ⠀⠀⠀⠀⠀⠀⠀⢠⡶⠻⠛⠟⠋⠉⠀⠈⠤⠴⠶⠶⢾⣿⣿⣿⣷⣦⠄⠀⠀⠀                𓐓  Makefile 𓐔           
#  ⠀⠀⠀⠀⠀⢀⠔⠋⠀⠀⠤⠒⠒⢲⠀⠀⠀⢀⣠⣤⣤⣬⣽⣿⣿⣿⣷⣄⠀⠀                                              
#  ⠀⠀⠀⣀⣎⢤⣶⣾⠅⠀⠀⢀⡤⠏⠀⠀⠀⠠⣄⣈⡙⠻⢿⣿⣿⣿⣿⣿⣦⠀      Dev: oezzaou <oussama.ezzaou@gmail.com> 
#  ⢀⠔⠉⠀⠊⠿⠿⣿⠂⠠⠢⣤⠤⣤⣼⣿⣶⣶⣤⣝⣻⣷⣦⣍⡻⣿⣿⣿⣿⡀                                              
#  ⢾⣾⣆⣤⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠉⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇                                              
#  ⠀⠈⢋⢹⠋⠉⠙⢦⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇       Created: 2023/12/13 18:56:44 by oezzaou
#  ⠀⠀⠀⠑⠀⠀⠀⠈⡇⠀⠀⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠇       Updated: 2025/02/27 10:17:40 by oezzaou
#  ⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⢀⣾⣿⣿⠿⠟⠛⠋⠛⢿⣿⣿⠻⣿⣿⣿⣿⡿⠀                                              
#  ⠀⠀⠀⠀⠀⠀⠀⢀⠇⠀⢠⣿⣟⣭⣤⣶⣦⣄⡀⠀⠀⠈⠻⠀⠘⣿⣿⣿⠇⠀                                              
#  ⠀⠀⠀⠀⠀⠱⠤⠊⠀⢀⣿⡿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠘⣿⠏⠀⠀                             𓆩♕𓆪      
#  ⠀⠀⠀⠀⠀⡄⠀⠀⠀⠘⢧⡀⠀⠀⠸⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀⠐⠋⠀⠀⠀                     𓄂 oussama ezzaou𓆃  
#  ⠀⠀⠀⠀⠀⠘⠄⣀⡀⠸⠓⠀⠀⠀⠠⠟⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀                                              

#====<[ CC compiler: ]>=========================================================
CC					:= c++
CPPFLAGS		:= -Wall -Wextra -Werror -std=c++98
RM					:= rm -rf

#====< Sources >================================================================
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

#====< Rules >==================================================================
all: signature $(STATIC_LIB) $(SHARED_LIB)
	@test | awk '\
		BEGIN {\
		for (i=0; i < 70; i++){\
			printf("$(GREEN)▇$(END)");\
			system("sleep 0.01");\
		}\
	} END{printf "\n"}'
	@echo "${GREEN}[OK] ${CYAN}$(STATIC_LIB) ✔️${RESET}"
	@echo "${GREEN}[OK] ${CYAN}$(SHARED_LIB) ✔️${RESET}"

$(STATIC_LIB): $(OBJ)
	@ar rcs $@ $^  

$(SHARED_LIB): $(OBJ)
	@$(CC) $(CPPFLAGS) -shared -o $@ $^  

signature:
	@printf "${GRAY}%19s${RESET}\n"	"𓆩♕𓆪"
	@printf "${GRAY}%s${RESET}\n"		"𓄂 oussama ezzaou"

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp | .create_dir 
	@$(CC) $(CPPFLAGS) $(INCLUDE) -fPIC -c $< -o $@
	@printf "$(GREEN)[OK]${RESET} ${PINK}Compiling${RESET} %-33s| $@\n" "$<"

$(OBJ_DIR):
	@mkdir -p $@

clean:
	@if [ -d $(OBJ_DIR) ]; then\
		${RM} $(OBJ_DIR);\
		printf "${GREEN}[OK]${RESET} ${ORANGE}Cleaning  %-33s${RESET}| ./%s\n"\
					 "... " "$(PROJECT)/$(OBJ_DIR) ✔️";\
	else\
		printf "${RED}[KO]${RESET} ${BLUE}Not Found %-33s${RESET}| ./%s\n"\
					 "..." "$(PROJECT)/$(OBJ_DIR) ✖️";\
	fi

fclean: clean
	@if [ -f $(STATIC_LIB) ]; then\
		${RM} $(STATIC_LIB);\
		printf "${GREEN}[OK]${RESET} ${ORANGE}Cleaning  %-33s${RESET}| ./%s\n"\
				 "... " "$(PROJECT)/$(STATIC_LIB) ✔️";\
	elif [ ! -f $(STATIC_LIB) ]; then\
		printf "${RED}[KO]${RESET} ${BLUE}Not Found %-33s${RESET}| ./%s\n"\
					 "..." "$(PROJECT)/$(STATIC_LIB) ✖️";\
	fi
	@if [ -f $(SHARED_LIB) ]; then\
		${RM} $(SHARED_LIB);\
		printf "${GREEN}[OK]${RESET} ${ORANGE}Cleaning  %-33s${RESET}| ./%s\n"\
				 "... " "$(PROJECT)/$(SHARED_LIB) ✔️";\
	elif [ ! -f $(SHARED_LIB) ]; then\
		printf "${RED}[KO]${RESET} ${BLUE}Not Found %-33s${RESET}| ./%s\n"\
					 "..." "$(PROJECT)/$(SHARED_LIB) ✖️";\
	fi

re: fclean all

.create_dir: $(OBJ_DIR)

.SUFFIXES: .o .cpp .tpp .a .so 

.PHONY: all clean fclean re signature
#===============================================================================
