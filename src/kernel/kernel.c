#include "../common.h"
#include "../drivers/screen.h"
#include "./utils.h"


s32		kmain()
{	
	clear_screen();
	
	kprint("Welcome to My OS\n");
	kprint("@Filimonov Stanislav ");
	kprint_colored("https://github.com/thedenisnikulin", 0xf0);
	return 0;
}
