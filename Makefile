#             ################                                                  
#           ####################                                                
#         ########################                                              
#        #############+########### #                                            
#        ######-..        .+########        < Makefile >                        
#        ####-..            ..+####                                             
#        ###-...             .-####                                             
#        ###...              ..+##    Student: oezzaou <oezzaou@student.1337.ma>
#         #-.++###.      -###+..##                                              
#         #....  ...   .-.  ....##       Created: 2023/12/13 18:56:44 by oussama
#      --.#.-#+## -..  -+ ##-#-.-...     Updated: 2023/12/16 18:54:23 by oussama
#       ---....... ..  ........... -                                            
#       -+#..     ..   .       .+-.                                             
#        .--.     .     .     ..+.                                              
#          -..    .+--.-.     ...                                               
#          +.... .-+#.#+.    ..-                                                
#           +...#####-++###-..-                                                 
#           #---..----+--.---+##                                                
#         ###-+--.... ....--+#####                                              
#   ##########--#-.......-#-###########      Made By Oussama Ezzaou <OEZZAOU> :)

#====< Variables >==============================================================
NAME		:= btc
CC			:= c++
CPPFLAGS	:= -std=c++98 -Wall -Wextra -Werror #-Wuninitialized
OBJ_DIR		:= objs
SRC			:= $(wildcard *.cpp)
OBJ			:= $(addprefix $(OBJ_DIR)/, $(addsuffix .o, $(basename $(SRC))))
RM			:= rm -rf

#====< Colors >=================================================================
RED			:= \033[0;31m
GREEN		:= \033[0;32m
BLUE		:= \033[0;34m
YELLOW		:= \033[0;33m
END			:= \033[0m

#====< Rules >==================================================================
all: $(NAME)

$(NAME): $(OBJ)
	@echo "\r"
	@$(CC) $(CPPFLAGS) $^ -o $@
	@test | awk '						\
	BEGIN{								\
		for (i=0; i < 50; i++){			\
			printf("$(GREEN)▇$(END)");	\
			system("sleep 0.01");		\
		}								\
		print("");				\
	}'									

$(OBJ_DIR)/%.o: %.cpp | $(OBJ_DIR)
	@$(CC) $(CPPFLAGS) -c $< -o $@
	@printf "✅	Compiling... %5s\n" $<

$(OBJ_DIR):
	@mkdir -p $@

clean:
	@${RM} $(OBJ_DIR)
	@printf "✅	cleaning objs...\n"

fclean: clean
	@${RM} $(NAME)
	@printf "✅	cleaning program...\n"

re: fclean all

run:
	@./$(NAME)

.SUFFIXES: .o .cpp .tpp
.PHONY: all clean fclean re run
#===============================================================================
