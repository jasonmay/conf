" Vim syntax file for Parrot Assembly Code
"
" Version : 0.2
" Based on Parrot 0.10
" 
" Maintainer : Kevin Harris <kharris@satlug.org>

" Quit if syntax file already loaded and vim < 6.x. This is pretty standard.
if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif
" The Parrot is case-sensitive.
syntax case match

syntax match ParrotComment /#.*/ "Can the comment be after code?
"syntax match ParrotLabel /[A-Za-z0-9_].*:/
syntax match ParrotLabel /[A-Za-z0-9_].*/
"syntax match ParrotOpCode /[a-z_]+\ /
"syntax match ParrotDirective /[A-Z].*\ /
"
"Registers
"I[0-31] - INTVAL
"N[0-31] - FLOATVAL
"S[0-31] - STRING
"P[0-31] -Parrot Magic Cookie (PMC)
"
syntax match ParrotPointerRegister /[PS][0-9]\+/
syntax match ParrotNumericRegister /[IN][0-9]\+/

"syntax keyword ParrotPerlClasses \.PerlUndef \.PerlInt \.PerlNum \.PerlString \.PerlArray \.PerlHash .PerlHash
syntax match ParrotPerlClasses /\.Perl.*/

syntax region ParrotString start=/"/ skip=/\\"/ end=/"/ oneline
"syntax match ParrotNumber /\ [0-9]\+/

syntax match decNumber		"0\+[1-7]\=[\t\n$,; ]"
syntax match decNumber		"[1-9]\d*"
syntax match octNumber		"0[0-7][0-7]\+"
syntax match hexNumber		"0[xX][0-9a-fA-F]\+"
syntax match binNumber		"0[bB][0-1]*"

" Op-codes
syntax keyword ParrotControlOps if jump branch jsr bsr ret end unless

syntax keyword ParrotDataManipulatorOps new set clone tostring add sub mul div inc dec length concat repeat substr eq mod ne chopn 

syntax keyword ParrotTransMathOps sin cos tan sec atan atan2 asin acos asec cosh sinh tanh sech log2 log10 ln log pow exp

syntax keyword ParrotRegisterandStackOps push_p push_p_c pop_p pop_i pop_i_c push_s push_s_c pop_s push_n push_n_c pop_n save_i save_s save_p save_n restore_i restore_s restore_p restore_n entrytype set_warp warp

syntax keyword ParrotNameandPadOps find_lex find_global find_global_table find_global_slot fetch_lex fetch_global store_global newpad

syntax keyword ParrotExceptionOps set_eh clear_eh throw rethrow

syntax keyword ParrotObjectOps make_object find_method call_method find_attribute set_attribute can isa

syntax keyword ParrotModuleOps load_bytecode load_opcode_lib load_string_lib get_op_count get_string_name find_string_lib

syntax keyword ParrotIOOps new_fh open read write wait readw writew seek tell status readline close print

syntax keyword ParrotThreadingOps lock unlock pushunlock

syntax keyword ParrotInterpreterOps newinterp runinterp callout

syntax keyword ParrotGarbageCollectionOps sweep collect pausecollect resumecollect

syntax keyword ParrotKeyOps new_key clone_key size_key toss_key ke_type ke_value chop_key inc_key set_key

syntax keyword ParrotSymbolicOps setline setfile setpackage getline getfile getpackage

syntax keyword ParrotMiscOps index pack

if !exists("did_Parrot_syntax_inits")
    let did_Parrot_syntax_inits=1
    highlight link ParrotComment Comment
    highlight link ParrotLabel Special
	highlight link ParrotString String
"	highlight link ParrotNumber Number
    highlight link decNumber Number
    highlight link decNumber Number
    highlight link octNumber Number
    highlight link hexNumber Number
    highlight link binNumber Number

    highlight link ParrotPointerRegister PointerIdentifier
    highlight link ParrotNumericRegister NumericIdentifier 
    highlight link ParrotPerlClasses Special

    highlight link ParrotControlOps Conditional
    highlight link ParrotDataManipulatorOps Operator
    highlight link ParrotTransMathOps Statement
    highlight link ParrotRegisterandStackOps Keyword
    highlight link ParrotNameandPadOps Keyword
    highlight link ParrotExceptionOps Statement
    highlight link ParrotObjectOps Object
    highlight link ParrotModuleOps Keyword
    highlight link ParrotIOOps Statement
    highlight link ParrotThreadingOps Statement
    highlight link ParrotInterpreterOps Preproc
    highlight link ParrotGarbageCollectionOps Statement
    highlight link ParrotKeyOps Statement
    highlight link ParrotSymbolicOps Preproc
    highlight link ParrotMiscOps Comment

    " My color overrides. Change to taste.
    "highlight Comment ctermfg=red
    highlight PointerIdentifier ctermfg=magenta
    highlight NumericIdentifier ctermfg=brown
    highlight Object ctermfg=red ctermbg=lightgrey
    "highlight Type ctermbg=black ctermfg=brown

endif
let b:current_syntax="parrot"
