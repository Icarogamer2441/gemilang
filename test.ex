// you need to use list() if you want to create lists with no items
/*
how to use std::dev ->
"dev::todo(func->name)" (todo)
"dev::imple(func->name)" (implementing)
*/
/*
how to print messages ->
io::printnow(msg);
concs ->
io::printnow("10 + 20 = {int}", 10 + 20);

<?langcreator
langname = "ohmaga";
extension = "ohmaga";
import std::err;
import std::io;
import std::dev;
import std::lang;

type enum {
     ID,
     INT,
     FLOAT,
     STRING,
} T_type;

list tokenize(code) {
     tokens = list();
     pos = 0;
     while (pos < code.len) {
    	  token = code->pos;
	  pos++;
	  if (token = "-" and code->pos.isint()) {
	       token = code->pos;
	       pos++;
	       fnl = ""
	       while ((token.isint() or token == ".") and pos < code.len) {
	     	    fnl.conc = token

		    token = code->pos;
		    pos++;
	       }
	       if (fnl.isint()) {
	     	    appendto tokens([T_type::INT, (int)fnl]);
	       } elseif (fnl.isfloat()) {
	            appendto tokens([T_type::FLOAT, (float)fnl]);
	       } else {
	       	    throw err:Error("Unknown type -> {}".conc(fnl));
	       }
	  } elseif (token.isident()) {
	       fnl = "";
	       while (token.isident() and pos < code.len) {
	       	    fnl.conc = token;
	       }
	       appendto tokens([T_type::ID, fnl]);
	  } elseif (token == '"') {
	       fnl = ""
	       while (token != '"' and pos < code.len) {
	       	     fnl.conc = token

		     token = code->pos;
		     pos++;
	       }
	       appendto tokens([T_type::STRING, fnl]);
	  }
     }
}

void inter2(code) {
     tokens = tokenize(code);
     pos = 0;
     while (pos < tokens.size) {
     	  token = tokens->pos;
	  pos++;
	  if (token[0] == T_type::ID) {
	       if (token[1] == "showln") {
	       	    msgs = list(lang::handle_print_args(separetor=",", tokens=tokens->pos->lend));
		    foreach(msgs as msg) {
		         io::printnow("{string/string/float/list}", msg);
		    }
		    io::printnow("\n");
	       }
	  }
     }
}

void inter(code) {
     tokens = tokenize(code);
     pos = 0;
     while (pos < tokens.size) {
     	   token = tokens[pos]
	   pos++;
	   if (token[0] == T_type::ID) {
	      	if (token[1] == "int") {
		    lang::argsctypes(INT=TRUE, FLOAT=TRUE, STRING=TRUE, LIST=TRUE);
		    lang::handle_args(argtype=TRUE, argstruct="<name>: <type>" || "<name>:<type>");
		    fcode = lang::handle_codeblocks(rettype=lang::F_types::INTEGER, returns="return<code>;", tokens=tokens->pos->lend);
		} elseif (token[1] == "float") {
		    lang::argstypes(INT=TRUE, FLOAT=TRUE, STRING=TRUE, LIST=TRUE);
		    lang::handle_args(argtype=TRUE, argstruct="<name>: <type>" || "<name>:<type>");
		    fcode = lang::handle_codeblocks(rettype=lang::F_types::FLOAT, returns="return<code>;", tokens=tokens->pos->lend);
		} elseif (token[1] == "string") {
		    lang::argstypes(INT=TRUE, FLOAT=TRUE, STRING=TRUE, LIST=TRUE);
		    lang::handle_args(argtype=TRUE, argstruct="<name>: <type>" || "<name>:<type>");
		    fcode = lang::handle_codeblocks(rettype=lang::F_types::STRING, returns="return<code>;", tokens=tokens->pos->lend);
		} elseif (token[1] == "list") {
		    lang::argstypes(INT=TRUE, FLOAT=TRUE, STRING=TRUE, LIST=TRUE);
		    lang::handle_args(argtype=TRUE, argstruct="<name>: <type>" || "<name>:<type>");
		    fcode = lang::handle_codeblocks(rettype=lang::F_types::LIST, returns="return<code>;", tokens=tokens->pos->lend);
		}
		inter2(fcode);
	   }
     }
}

int main(argc, argv[]) {
    ifile file = fopen(argv[1]); // ifile == input file
    code = fread(file);

    inter(code);

    return 0;
}
?end>

<?cmd
argv = ['test.lngcrte', 'test.ohmaga']
?end>

<?test.ohmaga
int main() {
    showln("Hello world!\n");
}
?end>