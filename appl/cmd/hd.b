implement Hd;

include "sys.m";
	sys: Sys;

include "draw.m";

include "string.m";

stderr: ref Sys->FD;

Hd: module {
	init:	fn(nil: ref Draw->Context, argv: list of string);
};


init(nil: ref Draw->Context, argv: list of string)
{
	sys = load Sys Sys->PATH;
	stderr = sys->fildes(2);
	str := load String String->PATH;

	if(len argv < 2)
		usage();

	argv = tl argv;

	out := str->quoted(hd str->unquoted(str->quoted(argv)) :: nil);
	sys->print("%s\n", out);

	exit;
}

usage() {
	sys->fprint(stderr, "usage: hd (list 'of tokens')\n");
	exit;
}
