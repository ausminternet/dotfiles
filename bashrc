[ -n "$PS1" ] && source ~/.bash_profile;

PATH="/Users/jah/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/jah/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/jah/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/jah/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/jah/perl5"; export PERL_MM_OPT;
