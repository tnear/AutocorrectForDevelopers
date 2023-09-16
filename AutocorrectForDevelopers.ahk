#Requires AutoHotkey v2 ; note: v1 is also supported, see https://github.com/tnear/AutocorrectForDevelopers
#SingleInstance Force

; INTRODUCTION
; AutocorrectForDevelopers is an AutoHotkey script which automatically fixes typos
; using rules tailored for software developer environments. The rules in this script
; contain many corrections for common developer words involving keywords, classes,
; methods, programming languages, and programming disciplines.
; Latest version is located here: https://github.com/tnear/AutocorrectForDevelopers


; DOCUMENTATION
; AHK hotstrings: https://www.autohotkey.com/docs/v2/Hotstrings.htm
;   Prefix dictionary search: https://www.litscape.com/word_tools/starts_with.php
;   Suffix dictionary search: https://www.litscape.com/word_tools/ends_with.php
; Contains dictionary search: https://www.litscape.com/word_tools/contains_sequence.php
; :C: = Match case.
; :*: = Ending char not required. Often added to encompass substrings.
;       For example, this rule -> :*:ansewr::answer
;       ...will convert 'ansewr' -> 'answer' before typing an ending character.
;       This lets it match 'answer', 'answers', 'answered', ...
; :?: = matches inside other words used for suffixes, ex, :?:tign::ting => testign -> testing.
;       The '?' option still needs ending char.

; END CHARS
; Add '<' and '>' to supported ending characters (useful for C++ templates).
;    Note: all EndChars characters below except '<' and '>' are default AHK end chars:
#Hotstring EndChars -()[]{}:;'"/\,.?!`n `t<>

; AHK VERSION 2 vs. VERSION 1
; Relevant AutocorrectForDevelopers v1 <=> v2 differences:
; Directives: #HotIf (v2) is #If (v1)
; For literal colons, each colon needs to be escaped in v2: `:`:
;     For v1, you only need to escape double colon: `::

; SCRIPT
; Exclude AHK script from MS Word because it already has an autocorrect (though it's not heavy on programming words).
; Note: this conditional should be changed if you would like to include or exclude other applications.
#HotIf !WinActive('ahk_exe WINWORD.exe')

    ; WHITELIST
    ; Start by listing the whitelist (permit these words by setting backspace to zero, b0)
    ;     Note: the whitelist section must be above suffix section

    ; -aite word suffix whitelist (do not convert these to -iate)
    :b0:aite::
    {
    }
    :b0:ilvaite::
    {
    }
    :b0:waite::
    {
        ; surname
    }

    ; -atie word suffix whitelist (do not convert these to -ative)
    :b0:atie::
    {
    }
    :b0:catie::
    {
    }
    :b0:katie::
    {
    }

    ; -dnet word suffix whitelist (do not convert these to -dent)
    :b0:dnet::
    {
    }
    :b0:wordnet::
    {
    }

    ; -ign word suffix whitelist (do not convert these to -ing)
    :b0:ign::
    {
    }
    :b0:align::
    {
    }
    :b0:arraign::
    {
    }
    :b0:assign::
    {
    }
    :b0:benign::
    {
    }
    :b0:beign::
    {
        ; not a word, but ambiguous between 'begin', 'being', and 'benign'
        ; therefore, whitelist it
    }
    :b0:campaign::
    {
    }
    :b0:codesign::
    {
    }
    :b0:condign::
    {
    }
    :b0:consign::
    {
    }
    :b0:cosign::
    {
    }
    :b0:countersign::
    {
    }
    :b0:dealign::
    {
    }
    :b0:deign::
    {
    }
    :b0:deraign::
    {
    }
    :b0:design::
    {
    }
    :b0:disalign::
    {
    }
    :b0:eloign::
    {
    }
    :b0:ensign::
    {
    }
    :b0:feign::
    {
    }
    :b0:foreign::
    {
    }
    :b0:malign::
    {
    }
    :b0:misalign::
    {
    }
    :b0:misassign::
    {
    }
    :b0:nondesign::
    {
    }
    :b0:outdesign::
    {
    }
    :b0:outreign::
    {
    }
    :b0:overdesign::
    {
    }
    :b0:preassign::
    {
    }
    :b0:predesign::
    {
    }
    :b0:realign::
    {
    }
    :b0:reassign::
    {
    }
    :b0:reconsign::
    {
    }
    :b0:redesign::
    {
    }
    :b0:reign::
    {
    }
    :b0:resign::
    {
    }
    :b0:roadsign::
    {
    }
    :b0:sign::
    {
    }
    :b0:sovereign::
    {
    }
    :b0:unalign::
    {
    }
    :b0:unassign::
    {
    }
    :b0:unbenign::
    {
    }
    :b0:underdesign::
    {
    }
    :b0:undersign::
    {
    }
    :b0:undesign::
    {
    }
    :b0:unsign::
    {
    }

    ; -itonal word suffix whitelist (do not convert these to -tional)
    :b0:itonal::
    {
    }
    :b0:baritonal::
    {
    }

    ; -mnet word suffix whitelist (do not convert these to -ment)
    :b0:mnet::
    {
    }
    :b0:boomnet::
    {
    }

    ; -nat word suffix whitelist (do not convert these to -ant)
    :b0:nat::
    {
    }
    :b0:gnat::
    {
    }

    ; -ntae word suffix whitelist (do not convert these to -nate)
    :b0:ntae::
    {
    }
    :b0:placentae::
    {
    }

    ; -ouis word suffix whitelist (do not convert these to -ious)
    :b0:ouis::
    {
    }
    :b0:louis::
    {
    }

    ; -sino word suffix whitelist (do not convert these to -sion)
    :b0:sino::
    {
    }
    :b0:casino::
    {
    }

    ; -sinos word suffix whitelist (do not convert these to -sions)
    :b0:sinos::
    {
    }
    :b0:casinos::
    {
    }

    ; -tino word suffix whitelist (do not convert these to -tion)
    :b0:tino::
    {
    }
    :b0:latino::
    {
    }

    ; -tinos word suffix whitelist (do not convert these to -tions)
    :b0:tinos::
    {
    }
    :b0:latinos::
    {
    }

    ; -tued word suffix whitelist (do not convert these to -uted)
    :b0:tued::
    {
    }
    :b0:statued::
    {
    }

    ; -tues word suffix whitelist (do not convert these to -utes)
    :b0:tues::
    {
    }
    :b0:statues::
    {
    }
    :b0:virtues::
    {
    }

    ; -vie word suffix whitelist (do not convert these to -ive)
    :b0:vie::
    {
    }
    :b0:movie::
    {
    }

    ; whitelist suffixes (only autocorrect these when they appear as suffixes, see bottom of script)
    :b0:aenous::
    {
        ; do not convert this string to -aneous
    }
    :b0:aetd::
    {
        ; do not convert this string to -ated
    }
    :b0:alble::
    {
        ; do not convert this string to -lable
    }
    :b0:aiton::
    {
        ; do not convert this string to -ation
    }
    :b0:autl::
    {
        ; do not convert this string to -ault
    }
    :b0:bilties::
    {
        ; do not convert this string to -bilities
    }
    :b0:bilites::
    {
        ; do not convert this string to -bilities
    }
    :b0:bilty::
    {
        ; do not convert this string to -bility
    }
    :b0:blities::
    {
        ; do not convert this string to -bilities
    }
    :b0:blity::
    {
        ; do not convert this string to -bility
    }
    :b0:borad::
    {
        ; do not convert this string to -board
    }
    :b0:btue::
    {
        ; do not convert this string to -bute
    }
    :b0:denet::
    {
        ; do not convert this string to -dent
    }
    :b0:emnt::
    {
        ; do not convert this string to -ment
    }
    :b0:emnts::
    {
        ; do not convert this string to -ments
    }
    :b0:epr::
    {
        ; do not convert this string to -per
    }
    :b0:garphy::
    {
        ; do not convert this string to -graphy
    }
    :b0:hsing::
    {
        ; do not convert this string to -shing
    }
    :b0:icla::
    {
        ; do not convert this string to -ical
    }
    :b0:idng::
    {
        ; do not convert this string to -ding
    }
    :b0:ietn::
    {
        ; do not convert this string to -ient
    }
    :b0:iezd::
    {
        ; do not convert this string to -ized
    }
    :b0:igth::
    {
        ; do not convert this string to -ight
    }
    :b0:iison::
    {
        ; do not convert this string to -ision
    }
    :b0:iivty::
    {
        ; do not convert this string to -ivity
    }
    :b0:ikc::
    {
        ; do not convert this string to -ick
    }
    :b0:ikcs::
    {
        ; do not convert this string to -icks
    }
    :b0:ioanl::
    {
        ; do not convert this string to -ional
    }
    :b0:iont::
    {
        ; do not convert this string to -oint
    }
    :b0:ionts::
    {
        ; do not convert this string to -oints
    }
    :b0:iotn::
    {
        ; do not convert this string to -tion
    }
    :b0:iotns::
    {
        ; do not convert this string to -tions
    }
    :b0:itme::
    {
        ; do not convert this string to -time or -items
    }
    :b0:itmes::
    {
        ; do not convert this string to -times or -items
    }
    :b0:iton::
    {
        ; do not convert this string to -tion
    }
    :b0:itons::
    {
        ; do not convert this string to -tions
    }
    :b0:ivley::
    {
        ; do not convert this string to -ively
    }
    :b0:iviyt::
    {
        ; do not convert this string to -ivity
    }
    :b0:kae::
    {
        ; do not convert this string to -ake
    }
    :b0:kaeg::
    {
        ; do not convert this string to -kage
    }
    :b0:kaes::
    {
        ; do not convert this string to -akes
    }
    :b0:liity::
    {
        ; do not convert this string to -ility
    }
    :b0:ltiy::
    {
        ; do not convert this string to -lity
    }
    :b0:maeg::
    {
        ; do not convert this string to -mage
    }
    :b0:maion::
    {
        ; do not convert this string to -mation
    }
    :b0:meents::
    {
        ; do not convert this string to -ments
    }
    :b0:menet::
    {
        ; do not convert this string to -ment
    }
    :b0:menets::
    {
        ; do not convert this string to -ments
    }
    :b0:metn::
    {
        ; do not convert this string to -ment
    }
    :b0:metns::
    {
        ; do not convert this string to -ments
    }
    :b0:mnets::
    {
        ; do not convert this string to -ments
    }
    :b0:mzie::
    {
        ; do not convert this string to -mize
    }
    :b0:mzied::
    {
        ; do not convert this string to -mized
    }
    :b0:mzies::
    {
        ; do not convert this string to -mizes
    }
    :b0:naet::
    {
        ; do not convert this string to -nate
    }
    :b0:nig::
    {
        ; do not convert this string to -ing
    }
    :b0:ntiy::
    {
        ; do not convert this string to -nity
    }
    :b0:oeus::
    {
        ; do not convert this string to -eous
    }
    :b0:ofrm::
    {
        ; do not convert this string to -form
    }
    :b0:oinal::
    {
        ; do not convert this string to -ional
    }
    :b0:oitn::
    {
        ; do not convert this string to -oint
    }
    :b0:oitns::
    {
        ; do not convert this string to -oints
    }
    :b0:oius::
    {
        ; do not convert this string to -ious
    }
    :b0:prot::
    {
        ; do not convert this string to -port
    }
    :b0:prots::
    {
        ; do not convert this string to -ports
    }
    :b0:rtiy::
    {
        ; do not convert this string to -rity
    }
    :b0:oudn::
    {
        ; do not convert this string to -ound
    }
    :b0:oudns::
    {
        ; do not convert this string to -ounds
    }
    :b0:oyp::
    {
        ; do not convert this string to -opy
    }
    :b0:raeg::
    {
        ; do not convert this string to -rage
    }
    :b0:sehd::
    {
        ; do not convert this string to -shed
    }
    :b0:soin::
    {
        ; do not convert this string to -sion
    }
    :b0:soins::
    {
        ; do not convert this string to -sions
    }
    :b0:stiy::
    {
        ; do not convert this string to -sity
    }
    :b0:taeg::
    {
        ; do not convert this string to -tage
    }
    :b0:taion::
    {
        ; do not convert this string to -ation
    }
    :b0:taoin::
    {
        ; do not convert this string to -ation
    }
    :b0:tehr::
    {
        ; do not convert this string to -ther
    }
    :b0:tenet::
    {
        ; do not convert this string to -tent
    }
    :b0:thc::
    {
        ; do not convert this string to -tch
    }
    :b0:thces::
    {
        ; do not convert this string to -tches
    }
    :b0:tiive::
    {
        ; do not convert this string to -itive
    }
    :b0:tiosn::
    {
        ; do not convert this string to -tions
    }
    :b0:tiyt::
    {
        ; do not convert this string to -tity
    }
    :b0:tnation::
    {
        ; do not convert this string to -ntation
    }
    :b0:toin::
    {
        ; do not convert this string to -tion
    }
    :b0:toins::
    {
        ; do not convert this string to -tions
    }
    :b0:ttiy::
    {
        ; do not convert this string to -tity
    }
    :b0:tuer::
    {
        ; do not convert this string to -ture
    }
    :b0:tuers::
    {
        ; do not convert this string to -tures
    }
    :b0:tues::
    {
        ; do not convert this string to -utes
    }
    :b0:tuion::
    {
        ; do not convert this string to -ution
    }
    :b0:utls::
    {
        ; do not convert this string to -ults
    }
    :b0:voe::
    {
        ; do not convert this string to -ove
    }
    :b0:vtiy::
    {
        ; do not convert this string to -vity
    }
    :b0:wrae::
    {
        ; do not convert this string to -ware
    }

    ; AUTOCORRECT LIST
    ; Autocorrect these strings.
    ; Basic syntax -> ::oldString::newString
    ;
    :C:#Include::{#}include         ; directive in C/C++. '#' on RHS must be escaped by enclosing in '{}'
    :C?*:.cmo::.com                 ; top-level domain
    
    ::abotu::about
    ::absoltue::absolute
    :*:abstarct::abstract           ; abstract/s, abstracted, abstraction/s
    :*:accomodat::accommodat        ; accommodate/s/d, accommodating
    ::activaet::activate
    ::adjacnecy::adjacency
    ::adminstrator::administrator
    ::administator::administrator
    ::adminstrators::administrators
    ::administators::administrators
    ::agian::again
    ::aehad::ahead
    :*:algoirthm::algorithm         ; algorithms, algorithmic
    :*:algorihtm::algorithm
    :*:algoirhtm::algorithm
    :*:algroithm::algorithm
    ::allcoate::allocate
    :*:allwo::allow                 ; allow/s/ed/ing/able
    ::almsot::almost
    :*:alhpa::alpha                 ; alphabet, alphabetize, alphanumeric
    ::alos::also
    ::alraedy::already
    ::alrady::already
    ::alreayd::already
    ::alhtough::although
    ::alwasy::always
    ::analagous::analogous
    :C:adn::and
    :C:Adn::And
    :C:nad::and
    :C:ANd::And
    ::andthe::and the
    ::antoehr::another
    :*:ansewr::answer               ; answer/s/ed
    ::anhyting::anything
    ::appearence::appearance
    ::appearences::appearances
    ::appication::application
    ::appilcation::application
    ::appications::applications
    ::appilcations::applications
    ::arhitecture::architecture
    ::archtiecture::architecture
    ::arugment::argument
    ::arguement::argument
    ::arguent::argument
    ::arugments::arguments
    ::arguements::arguments
    ::arguents::arguments
    ::arithemtic::arithmetic
    ::aray::array
    :*:arary::array                 ; array/s/ed, arrayfun (MATLAB)
    :*:arrray::array
    ::artifiical::artificial
    ::artifical::artificial
    ::assmebly::assembly
    :*:asert::assert                ; assertion, assertEqual, assertTrue
    :*:assrt::assert
    :*:asssert::assert
    ::assesment::assessment
    ::assesments::assessments
    ::asign::assign
    ::asigns::assigns
    ::asignment::assignment
    ::asignments::assignments
    ::asigned::assigned
    ::assoicative::associative
    ::asycn::async
    ::atmoic::atomic
    :*:atach::attach                ; ex: attach/ed/es/ment
    ::attakc::attack
    ::atribute::attribute
    ::attirbute::attribute
    ::attirubte::attribute
    ::attriubte::attribute
    ::atributes::attributes
    ::attirbutes::attributes
    ::attirubtes::attributes
    ::attriubtes::attributes
    ::auido::audio
    :*:authetnic::authentic         ; authentic/ate/ity/ator/ating
    :C:auot::auto                   ; C++ keyword
    ::automted::automated
    ::autoamted::automated
    ::avialable::available
    ::aveareg::average
    ::aveage::average
    ::avearegs::averages
    ::aveages::averages
    ::awiat::await
    ::alot::a lot

    :*:bakc::back                   ; backward, backload, backspace
    ::backgorund::background
    ::backwrad::backward
    ::backwrads::backwards
    :*:blanace::balance             ; balance/s/d
    :*:blaance::balance
    ::bandwith::bandwidth
    ::baselien::baseline
    ::baseilne::baseline
    ::becaues::because
    ::becasue::because
    ::becuase::because
    ::beofre::before
    ::begni::begin
    ::behaivor::behavior
    ::behvaior::behavior
    ::behaior::behavior
    ::behaivors::behaviors
    ::behvaiors::behaviors
    ::behaiors::behaviors
    ::benhcmark::benchmark
    ::benhcmarks::benchmarks
    ::betwen::between
    ::lbock::block
    ::boht::both
    ::boundries::boundaries
    ::boundry::boundary
    :*:brnach::branch               ; branch/ed/es, branching, branchless
    :*:brachn::branch
    :*:breka::break                 ; break/s, breakpoint/s, breakthrough
    :*:brkea::break
    ::breakthrouhg::breakthrough
    :*:braodcast::broadcast         ; broadcast/s/ed/ing/er
    ::borke::broke
    ::borwser::browser
    ::bulid::build
    ::biuld::build
    ::ubild::build
    ::bulids::builds
    ::biulds::builds
    ::ubilds::builds
    ::biult::built
    ::ubndle::bundle
    ::ubndles::bundles
    ::bytearay::bytearray           ; Python built-in type

    ::cahce::cache
    ::cahced::cached
    ::cahcing::caching
    ::calcualte::calculate
    ::calcualtes::calculates
    ::calender::calendar
    ::calenders::calendars
    ::caleld::called
    :C:cna::can
    :C:Cna::Can
    ::cnadidate::candidate
    ::cnadidates::candidates
    ::cannonical::canonical
    ; ::cant::can't ; interferes with "cant'" rule below
    ::cant'::can't
    ::captrue::capture
    ::catpure::capture
    ::cpature::capture
    ::captrues::captures
    ::catpures::captures
    ::cpatures::captures
    :C:caes::case                   ; switch-case
    :*:catagor::categor             ; category, categories, categorical
    ::cateogyr::category
    ::cateogry::category
    ::cuation::caution
    ::caues::cause
    ::casue::cause
    ::cauess::causes
    ::casues::causes
    ::chagne::change
    ::chagnes::changes
    ::chagned::changed
    ::chracter::character
    ::chracters::characters
    :*:chekc::check                 ; checkout, check/s/ed/er, checkpoint
    ::chidl::child
    ::chlid::child
    ::cihld::child
    ::chidlren::children
    ::chilren::children
    ::chlidren::children
    ::cihldren::children
    ::chocie::choice
    ::chocies::choices
    ::cihper::cipher
    ::cihpertext::ciphertext
    ::circuti::circuit
    ::circutis::circuits
    ::clas::class
    ::clss::class
    ::clsses::classes
    ::clasdef::classdef
    ::clasifier::classifier
    ::classifer::classifier
    ::clasifiers::classifiers
    ::classifers::classifiers
    ::clena::clean
    ::clenas::cleans
    ::claer::clear
    ::claers::clears
    ::clickc::click
    ::clickcs::clicks
    ::clinet::client
    ::cleint::client
    ::clinets::clients
    ::cleints::clients
    ::clcok::clock
    ::clcoks::clocks
    ::cloen::clone
    ::cloens::clones
    ::clodu::cloud
    ::clutser::cluster
    ::clutsers::clusters
    :C:COde::Code                   ; VS Code
    ::colide::collide
    ::colides::collides
    ::colision::collision
    ::comibnation::combination
    ::comibnations::combinations
    ::comand::command
    ::commnad::command
    ::commadn::command
    ::commmand::command
    ::comands::commands
    ::commnads::commands
    ::commadns::commands
    ::commmands::commands
    ::comit::commit
    ::comits::commits
    ::comitment::commitment
    ::comitments::commitments
    ::comited::committed
    ::commited::committed
    :*:comapre::compare             ; compare/s/d
    ::comparision::comparison
    ::comparisions::comparisons
    ::compatability::compatibility
    ::compatabilities::compatibilities
    ::compatable::compatible
    ::comiplation::compilation
    :*:comiple::compile             ; compile/r/d/s
    ::complier::compiler            ; 'complier' is a valid but rare word
    ::comiler::compiler
    ::compliers::compilers
    ::compileres::compilers
    ::comilers::compilers
    ::compelx::complex
    ::comopnent::component
    ::comopnents::components
    ::compsoe::compose
    ::compsoes::composes
    ::composeite::composite
    :*:compormis::compromis         ; compromis/e/ed/es/ing
    ::comptue::compute
    ::comptuer::computer            ; whitelist for -tuer -> -ture
    ::ocmputer::computer
    ::comptuers::computers
    ::ocmputers::computers
    ::concatneate::concatenate
    ::concatneates::concatenates
    ::concetp::concept              ; C++20 keyword
    ::concetps::concepts
    ::confidentality::confidentiality
    :*:conenct::connect             ; connect/s/ed/ion/ing/ions/or
    :*:conect::connect
    ::conseuctive::consecutive
    ::concensus::consensus
    ::considerd::considered
    :*:consitsen::consisten         ; consistent, consistency, consistently
    ::consistenet::consistent
    ::consistenyc::consistency
    ::consoel::console
    ::cosole::console
    ::consoe::console
    :*:cosnt::const                 ; const, constant, contructor, constraint
    :*:conts::const
    :*:ocnst::const
    ::constatn::constant
    ::constexrp::constexpr
    ::constratin::constraint
    ::constraitn::constraint
    ::constriant::constraint
    ::constratins::constraints
    ::constraitns::constraints
    ::constriants::constraints
    ::constuctor::constructor
    ::consutl::consult
    ::consuemr::consumer
    ::consuemrs::consumers
    :*:contian::contain             ; contains, container
    ::contaienr::container
    ::contaienrs::containers
    :*:contineu::continue           ; continue/d/s
    :*:ocntinue::continue
    :*:contniue::continue
    ::conitnuous::continuous
    ::conitnuously::continuously
    :*:contirbut::contribut         ; contribute/d, contributor
    :*:contorl::control             ; control/s/led/ler/ling
    :*:ocntrol::control
    ::convertes::converts
    ::cookei::cookie
    ::cookeis::cookies
    ::cpoy::copy
    ::copyrgiht::copyright
    :*:corect::correct              ; correct/ed/ion/tly/ness
    :*:corretc::correct
    ::coudl::could
    ::coudln't::couldn't
    :*:coutn::count                 ; count/s/ed/er/ing, countVarName
    :*:ocunt::count
    ::covearge::coverage
    ::coveage::coverage
    ::crahs::crash
    ::carsh::crash
    ::crahses::crashes
    ::carshes::crashes
    ::creat::create                 ; note: there exists a legacy C syscall called 'creat'
    ::creats::creates
    ::criteira::criteria
    :*:crytpo::crypto               ; cryptography, cryptographic/ally
    :C:CTrl::Ctrl                   ; 'Control' keyboard modifier
    ::curent::current
    ::currenet::current
    ::currrent::current
    ::currnet::current
    ::curretn::current
    ::currenetly::currently
    ::currrently::currently
    ::curently::currently
    ::currnetly::currently
    ::curretnly::currently
    ::cusror::cursor
    ::cusrors::cursors
    ::customie::customize
    ::customies::customizes

    ::dahsboard::dashboard
    :*:dadta::data                  ; data/set/sets/base
    ::databse::database
    ::databaes::database
    ::databses::databases
    ::dataest::dataset
    ::dataests::datasets
    ::daedlock::deadlock
    ::daedlocks::deadlocks
    ::deallcoate::deallocate
    ::deallcoates::deallocates
    ::debuger::debugger
    ::debuging::debugging
    :*:deicsion::decision           ; decision/s/al
    ::decrase::decrease
    ::decrases::decreases
    ::deepcpoy::deepcopy
    :*:deafult::default             ; default/s/ed
    :*:defualt::default
    :*:defien::define               ; define/s/d
    :*:dleete::delete               ; delete/s/d/r
    ::dleetion::deletion
    ::dleivery::delivery
    :*:dmeonstrat::demonstrat       ; demonstrat/e/s/ing/ion/ive
    :*:dpeend::depend               ; depends, dependency, dependence, dependencies
    :*:depenenc::dependenc
    :*:depht::depth                 ; depth, depthFirstSearch
    :*:detph::depth
    :*:derefernce::dereference      ; dereference/s/d
    ::descrbie::describe
    ::descirbe::describe
    ::descrbies::describes
    ::descirbes::describes
    ::desing::design
    ::deisgn::design
    ::desings::designs
    ::deisgns::designs
    ::determinsitic::deterministic
    :*:devleop::develop             ; developer, development, developed
    :*:devloep::develop
    :*:dvelop::develop
    :*:develoep::develop
    ::developr::developer
    ::developrs::developers
    ::developeres::developers
    ::developesr::developers
    ::develoment::development
    ::dialgo::dialog
    ::dialgos::dialogs
    ::dictinary::dictionary
    ::dictinoary::dictionary
    ::din'dt::didn't
    ::dind't::didn't
    ::didnt'::didn't
    ::diference::difference
    ::diferences::differences
    ::diferent::different
    :*:differnet::different         ; different/ial/iable/iate
    :*:dififcult::difficult         ; difficult, difficulty, difficulties
    :*:difficutl::difficult
    ::difficulyt::difficulty
    ::dimensinoal::dimensional
    ::dimensinoality::dimensionality
    ::directd::directed
    ::diretory::directory
    ::directoroy::directory
    ::driectory::directory
    ::diretories::directories
    ::driectories::directories
    ::diable::disable
    ::diables::disables
    :*:disconenct::disconnect       ; disconnect/ed/ion/ing/ions/or
    :*:disconect::disconnect
    ::dispaly::display
    ::idsplay::display
    ::dispalys::displays
    ::idsplays::displays
    :*:distni::distin               ; distinct/ion, distinguish/ing/ability
    ::distriuted::distributed
    ::distriubtion::distribution
    ::distirbution::distribution
    ::distriubtions::distributions
    ::distirbutions::distributions
    :*:docment::document            ; document/s/ed/ation
    :*:odcument::document
    :*:doucment::document
    ::doesnt'::doesn't
    ::doens't::doesn't
    ::doenst::doesn't
    ::doen'st::doesn't
    ::doesn ot::does not
    ::dont::don't
    ::doubel::double
    ::donwload::download
    ::donwloads::downloads
    ::downsream::downstream

    ::eahc::each
    ::eidtor::editor
    ::ediotr::editor
    ::editro::editor
    ::eidtors::editors
    ::ediotrs::editors
    ::editros::editors
    :*:eigne::eigen                 ; eigenvalues, eigenvectors, eigenspace
    ::electornic::electronic
    ::electornics::electronics
    :*:elemtn::element              ; element/s/al/ary
    :*:elemnt::element
    :*:elmeent::element
    :*:elmeetn::element
    ::elipse::ellipse
    ::ellitpic::elliptic            ; elliptic curve
    ::eliptic::elliptic
    ::esle::else
    ::esleif::elseif
    ::embeded::embedded
    ::emision::emission
    ::emited::emitted
    ::emiting::emitting
    ::emtpied::emptied
    ::emtpy::empty
    ::empyt::empty
    ::emulatro::emulator
    ::emulatros::emulators
    ::enbale::enable
    ::enbales::enables
    ::encapuslation::encapsulation
    :C:ENd::End                     ; common Visual Basic keyword
    ::engaeg::engage
    ::enginer::engineer
    ::enginers::engineers
    :*:enahnce::enhance             ; enhance/d/s/ment/ments
    ::enhancment::enhancement
    ::enhancments::enhancements
    ::enoguh::enough
    ::ensrue::ensure
    ::ensrues::ensures
    ::enumeate::enumerate
    ::enumeates::enumerates
    ::envrion::environ              ; Python's 'os.environ' parameter
    ::enviorn::environ
    ::envirno::environ
    ::enviroment::environment
    ::envrionment::environment
    ::enviornment::environment
    ::envirnoment::environment
    ::equivalenet::equivalent
    ::equivlent::equivalent
    ::eraes::erase
    ::errror::error
    ::errrors::errors
    :*:evlauat::evaluat             ; evaluate/d/s, evaluati/ng/on
    ::evenet::event
    ::evenets::events
    ::evvery::every
    ::eveyrone::everyone
    ::everyting::everything
    ::examien::examine
    ::examiens::examines
    ::eample::example
    ::examle::example
    ::exaple::example
    ::exmaple::example
    ::eamples::examples
    ::examles::examples
    ::exaples::examples
    ::exmaples::examples
    ::excetp::except
    ::excetpion::exception
    ::excetpions::exceptions
    ::excahnge::exchange
    ::excahnges::exchanges
    :*:exeuct::execut               ; execut/e/ing/ion/able
    ::exectue::execute
    ::exectable::executable
    ::exectables::executables
    ::existance::existence
    ::exapnd::expand
    ::exapnds::expands
    ::expectd::expected
    :*:exepri::experi               ; experience/s/d, experiment/s/ed/ation
    :*:expeir::experi
    ::explroer::explorer
    ::exopential::exponential
    ::expoentnial::exponential
    ::expoential::exponential
    ::expoenntial::exponential
    ::expoenential::exponential
    ::expoenentiation::exponentiation
    :*:exoprt::export               ; export/ed/er/s
    ::expor::export
    ::expresison::expression
    ::expresion::expression
    ::expresisons::expressions
    ::expresions::expressions
    ::extedn::extend
    ::exetnd::extend
    ::extedns::extends
    ::exetnds::extends
    ::extnesion::extension
    ::externla::external

    ::facotry::factory
    ::favoriet::favorite
    ::favoriets::favorites
    ::failrue::failure
    ::failrues::failures
    ::fallthrouhg::fallthrough
    ::flase::false
    :*:feasab::feasib               ; feasible, feasibly, feasibility
    ::fibonnaci::fibonacci          ; fibonacci sequence, fibonacci heap
    ::fiedl::field
    ::fiedls::fields
    ::fiel system::file system
    ::fielsystem::filesystem
    ::finaly::finally
    ::fidn::find
    ::fidns::finds
    ::fisrt::first
    ::firsrt::first
    ::flahs::flash
    ::flaot::float
    ::flaots::floats
    ::flaoting::floating            ; floating-point
    ::fodler::folder
    ::fodlers::folders
    ::fodling::folding
    ::folowing::following
    :C:fro::for                     ; 'for' keyword
    :C:ofr::for
    :C:foreeach::foreach            ; Perl keyword
    ::fo rthe::for the
    ::fort he::for the
    ::foregorund::foreground
    ::foriegn::foreign
    :C:forSOme::forSome             ; Scala keyword
    ::forwared::forward
    :*:foudna::founda               ; found/ation/ational
    ::founation::foundation
    ::fpritnf::fprintf              ; common file formatting function
    :*:framgent::fragment           ; fragment/s/ed/ing/ation
    ::frmae::frame
    ::frmaes::frames
    ::frmaework::framework
    :*:freuqen::frequen             ; frequen/t/cy/tly
    ::firend::friend
    ::firends::friends
    ::forzenset::frozenset
    :*:fucntion::function           ; function/s/al/ality/alities
    :*:funtion::function
    :*:fnction::function
    ::funadmental::fundamental
    ::fudnamental::fundamental
    ::funadmentals::fundamentals
    ::fudnamentals::fundamentals

    ::gatewya::gateway
    ::guage::gauge
    ::guages::gauges
    ::gausian::gaussian
    ::guassian::gaussian
    ::guasian::gaussian
    ::generatro::generator
    ::generatros::generators
    ::glboal::global
    ::goign::going
    ::oging::going
    ::goot::goto
    ::gradiet::gradient
    :C:grammer::grammar             ; case sensitive to exclude 'Grammer' surname
    :*:grpah::graph                 ; graphs, graphing, graphics
    :*:grahp::graph
    ::gredy::greedy
    ::gerat::great
    ::gorund::ground
    :*:gorup::group                 ; group/s/ed/ing
    :*:gropu::group

    :C:hsa::has
    :C:Hsa::Has
    ::hvae::have
    ::ahve::have
    ::haev::have
    ::hieght::height
    ::heruistic::heuristic
    ::heruistics::heuristics
    ::heirarchy::hierarchy
    ; ::hwo::how                    ; ambiguous between 'how' and 'who'
    ::howto::how to
    ::howver::however
    ::hudnred::hundred
    ::hudnreds::hundreds
    ::hyperparameer::hyperparameter
    ::hyperpareamter::hyperparameter
    ::hyperparaemter::hyperparameter
    ::hyperparmaeter::hyperparameter
    ::hyperparameers::hyperparameters
    ::hyperpareamters::hyperparameters
    ::hyperparaemters::hyperparameters
    ::hyperparmaeters::hyperparameters

    ::igonre::ignore
    ::igonres::ignores
    ::iamge::image
    ::iamges::images
    :*:implmenet::implement         ; implement/s/ation/ations
    :*:implmeent::implement
    ::implemenation::implementation
    ::implemenations::implementations
    :*:imoprt::import               ; import/s/ed/er
    ::impot::import
    ::impots::imports
    ::imporant::important
    ::imposible::impossible
    ::imposisble::impossible
    :*:incldue::include             ; include/s/d
    :*:incdlue::include
    ::includ::include
    ::inclue::include
    ::inclues::includes
    ::indistniguishable::indistinguishable
    ::indistniguishability::indistinguishability
    :*:infeasab::infeasib           ; infeasible, infeasibility
    ::inifnity::infinity
    :*:inofrmati::informati         ; information, informative, informatics
    ::incrase::increase
    ::increaes::increase
    ::incrases::increases
    ::indpeendent::independent
    ::independant::independent
    ::indpeendently::independently
    ::independantly::independently
    :*:idnex::index                 ; index/ed/es/ing
    ::ineequality::inequality
    :*:inherti::inherit             ; inherit/s/ance
    :*:inhreit::inherit
    :*:intiial::initial             ; initial, initialize/d, initialization
    ::inupt::input
    ::inptu::input
    ::inupts::inputs
    ::inptus::inputs
    :*:isnert::insert               ; insert/s/ion
    :*:isnta::insta                 ; instance, install, instantiate
    ::intance::instance
    ::instnace::instance
    ::intances::instances
    ::instnaces::instances
    ::isntead::instead
    ::intsead::instead
    ::intead::instead
    ::isnteadof::insteadof          ; PHP
    :*:isntr::instr                 ; instruction/s, instrument/s
    ::insruction::instruction
    ::insructions::instructions
    :C:itn::int                     ; integer data type
    ::itneger::integer
    ::itnegers::integers
    :*:integerate::integrate        ; integrate/s/d
    ::integriy::integrity
    :*:intelig::intellig            ; intellig/ent/ence/ible
    :*:itner::inter                 ; interface, internal, interact, interval
    ::interafce::interface
    :*:interopl::interpol           ; interpol/ate/ated/ates/ating
    :*:intepr::interp               ; interpolat/e/ion, interpret/s/ation
    ::internla::internal
    ::internlas::internals
    :*:interperet::interpret        ; interpret/s/ed/er
    ::interpeter::interpreter
    ::interupt::interrupt
    ::interupts::interrupts
    :C:inot::into                   ; sql keyword
    ::inthe::in the
    ::invariatn::invariant
    ::ivnariant::invariant
    ::invariatns::invariants
    ::ivnariants::invariants
    ::invertable::invertible
    ::i nrange::in range            ; Python loop
    ::iosream::iostream             ; standard C++ I/O header
    ::iosteam::iostream
    ::isotream::iostream
    ::isintance::isinstance         ; common Python function
    ::ins't::isn't
    ::isseu:::issue
    ::isseus::issues
    ::isthe::is the
    ::iteation::iteration
    ::itereation::iteration
    ::iteations::iterations
    ::itereations::iterations
    ::itereator::iterator
    ::iteator::iterator
    ::itereators::iterators
    ::iteators::iterators
    ::i'ts::it's
    ::i"d::i'd
    ::i"ll::i'll
    ::i"m::i'm
    ::i"ve::i've

    :C:javascritp::javascript       ; with 2 capital letters, this word does not fit AHK's traditional model
    :C:JavaScritp::JavaScript       ; therefore, it needs twice the rules
    :C:jaascript::javascript
    :C:JaaScript::JavaScript
    :C:javacript::javascript
    :C:Javacript::JavaScript
    :C:javasript::javascript
    :C:JavaSript::JavaScript
    ::jorunal::journal
    ::jsut::just

    ::keywrod::keyword
    ::keywrods::keywords
    ::knwo::know
    ::konw::know
    ::knwos::knows
    ::konws::knows
    ::knowlege::knowledge
    ::knwoledge::knowledge
    ::konwledge::knowledge

    ::lable::label
    ::lables::labels
    ::labmda::lambda
    ::lamda::lambda
    ::langauge::language
    ::langague::language
    ::lnaguage::language
    ::lagnuage::language
    ::lnagauge::language
    ::languaeg::language
    ::langauges::languages
    ::langagues::languages
    ::lnaguages::languages
    ::lagnuages::languages
    ::lnagauges::languages
    :*:lauchn::launch               ; launch/es/ed/ing
    ::leran::learn
    ::leraning::learning
    ::lerans::learns
    :C:elft::left                   ; binary tree left/right
    ::legnth::length
    ::lenght::length
    ::lnegth::length
    ::lesat::least
    ::liaiason::liaison
    ::laison::liaison
    ::laiason::liaison
    ::librarry::library
    ::lifetiem::lifetime
    ::liek::like
    :C:ilne::line
    ::lienar::linear
    ::lienarly::linearly
    ::ilnes::lines
    :C:LInux::Linux
    ::lniux::linux
    :*:lsit::list                   ; lists, listen/er/ers
    ::listenr::listener
    ::listenrs::listeners
    ::logairthm::logarithm
    ::lgoical::logical
    ::loign::login
    ::lookaisde::lookaside          ; translation lookaside buffer (TLB)
    ::looop::loop
    ::looops::loops
    ::lwoer::lower
    ::lwoercase::lowercase

    ::mahcine::machine
    ::machien::machine
    ::machins::machines
    ::macintohs::macintosh
    ::maintian::maintain
    ::maintians::maintains
    :C*:amke_::make_                ; C++: make_shared, make_unique, make_pair, ...
    :C*:mkae_::make_
    :C*:maek_::make_
    ::maloc::malloc
    :*:manaeg::manage               ; manage/r/d/rs/ment/eable
    :*:manfactur::manufactur        ; manufactur/ed/er/ing
    ::mnay::many
    ::marign::margin
    ::mathcing::matching
    ::mathamatics::mathematics
    ::mathmatics::mathematics
    ::mathamatical::mathematical
    ::mathmatical::mathematical
    ::maltab::matlab
    ::mtalab::matlab
    ::amtrix::matrix
    ::menas::means
    ::memoiation::memoization
    ::memroy::memory
    ::mrege::merge
    ::mreges::merges
    ::mreged::merged
    ::mesage::message
    ::mesages::messages
    ::messageing::messaging
    ::emtadata::metadata
    ::metadadta::metadata
    ::metadat::metadata
    ::microsfot::microsoft
    ::mispell::misspell
    ::modle::model
    ::mdoel::model
    ::modles::models
    ::mdoels::models
    ::moduel::module
    ::moduels::modules
    ::mroe::more
    ::omre::more
    ::muhc::much
    :*:mlti::multi                  ; multithreaded, multiplex, multiprocess, multitasking, multiply
    :*:mjulti::multi
    :*:mulitp::multip
    ::multipel::multiple

    ::nmae::name
    ::nmaes::names
    ::namelsit::namelist            ; FORTRAN statement
    ::namespce::namespace
    ::nmaespace::namespace
    ::namepace::namespace
    ::namepsace::namespace
    ::naer::near
    ::nerual::neural
    ::enxt::next

    :C:onde::node
    ::ondes::nodes
    ::normlaize::normalize
    ::normlaizes::normalizes
    :*:northwset::northwest
    :C:nto::not
    ::ntoes::notes
    ::nulll::null
    ::nulptr::nullptr
    ::nulllptr::nullptr
    :*:ojbect::object               ; object/s, objective/s
    ::ocurred::occurred
    ::occured::occurred
    ::ocurrence::occurrence
    ::occurence::occurrence
    ::occurrance::occurrence
    ::occurrrence::occurrence
    ::ocurrences::occurrences
    ::occurences::occurrences
    ::occurrances::occurrences
    ::occurrrences::occurrences
    ::offiical::official
    ::ofthe::of the
    ::ofteh::of the
    ::ofhte::of the
    ::fo the::of the
    ::oft he::of the
    ::ofthis::of this
    ::onthe::on the
    :*:opeation::operation          ; operation/al/s
    :*:operaetion::operation
    ::opeator::operator
    ::opeartor::operator
    ::oeprator::operator
    ::opeators::operators
    ::opeartors::operators
    ::oeprators::operators
    ::optgorup::optgroup            ; html tag
    ::optgropu::optgroup
    ::otpimal::optimal
    ::optimiation::optimization
    ::optimiations::optimizations
    ::optimze::optimize
    ::optimzes::optimizes
    :*:otpion::option               ; option/s/al/ally
    ::optioal::optional
    ::optinoally::optionally
    ::odrer::order
    ::odrers::orders
    ::orignal::original
    ::oriign::origin
    :*:ohter::other                 ; other/s/wise
    ::otehrs::others
    ::otehrwise::otherwise
    ::otheriwse::otherwise
    ::outocme::outcome
    ::outocmes::outcomes
    ::otuput::output
    ::ouptut::output
    ::otuputs::outputs
    ::ouptuts::outputs
    ::overlfow::overflow
    ::overlfows::overflows
    ::overhaed::overhead
    ::overiden::overridden
    ::overidden::overridden
    ::overriden::overridden
    ::overide::override             ; cannot do ':*:' b/c of words like overidealize and overidentify
    ::overides::overrides
    ::onwer::owner
    ::onwers::owners
    ::onwership::ownership

    :*:pacakge::package             ; package/s/d/r
    :*:packge::package
    :*:pakcage::package
    ::packte::packet
    ::packtes::packets
    :C:apge::page
    ::apges::page
    ::pallette::palette             ; ex: VSCode Command Palette
    ::paralel::parallel
    ::parllel::parallel
    ::parllle::parallel
    ::aprallel::parallel
    :*:pareamter::parameter         ; parameter/s/ise/ize/ization/isation
    :*:paraemter::parameter
    :*:parameer::parameter
    :*:parmaeter::parameter
    :*:aprameter::parameter
    :*:paramter::parameter
    :*:paramteer::parameter
    ::parameteres::parameters
    ::praent::parent
    ::parenet::parent
    ::aprent::parent
    :*:pasre::parse                 ; parse/d/s/r
    ::parital::partial
    :*:partiton::partition          ; partition/s/ed/ing
    ::passwrod::password
    ::pasword::password
    ::passowrd::password
    ::passwrods::passwords
    ::paswords::passwords
    ::passowrds::passwords
    ::paht::path
    ::pahtlib::pathlib
    ::apttern::pattern
    ::patern::pattern
    ::aptterns::patterns
    ::paterns::patterns
    ::perceptorn::perceptron
    ::perceptorns::perceptrons
    ::eprf::perf
    :*:eprform::perform             ; perform/s/ed/ance
    :*:perofrm::perform
    ::perfomance::performance
    ::perihperal::peripheral
    ::permanet::permanent
    ::permenant::permanent
    ::permanant::permanent
    :*:perimt::permit               ; permit/s/ted
    ::permtue::permute
    :*:persit::persist              ; persist/s/ed/ent/ing
    ::persistant::persistent
    ::persepctive::perspective
    ::persepctives::perspectives
    ::pertubation::perturbation
    ::pidgeonhole::pigeonhole       ; pigeonhole principle
    ::pixesl::pixels
    ::planend::planned
    ::platfomr::platform
    ::platfomrs::platforms
    ::pleae::please
    ::pluign::plugin
    ::pluigns::plugins
    ::opint::point
    ::opints::points
    ::poitner::pointer
    ::poitners::pointers
    ::oplicy::policy
    ::polymorhpic::polymorphic
    ::polynomail::polynomial
    ::polynomails::polynomials
    :C:pop+back::pop_back           ; common C++ container function
    ::posible::possible
    ::posisble::possible
    :*:pwoer::power                 ; power/ed, powerpoint, powershell
    :*:pratice::practice            ; practice/s/d
    ::prgama::pragma                ; #pragma
    ::prealocate::preallocate
    ::prealocates::preallocates
    ::predecssor::predecessor
    ::predecesor::predecessor
    ::rpedicate::predicate          ; a function returing true/false
    ::preidcate::predicate
    ::prefered::preferred
    ::prefecth::prefetch
    ::rpefix::prefix
    ::preporcessor::preprocessor
    ::preprocesor::preprocessor
    ::prevelant::prevalent
    :*:pritn::print                 ; print, printf, println
    ::privte::private
    :*:privelege::privilege         ; privilege/s/d
    :*:priviledge::privilege
    :*:probelm::problem             ; problem/s, problematic
    :*:problme::problem
    :*:prblem::problem
    :*:proceudr::procedur           ; procedure/s, procedural/ly
    ::proceses::processes
    ::procesing::processing
    ::porcessor::processor
    ::procesor::processor
    ::proflie::profile
    ::proflies::profiles
    :*:prgoram::program             ; programming, programmable, programmatic
    ::programable::programmable
    ::programatic::programmatic
    :*:proejct::project             ; project/s/ed/ing/ion
    ::proeprty::property
    ::propety::property
    ::proeprties::properties
    ::propeties::properties
    :*:prtoect::protect             ; protect/s/ed/or/ing/ion
    ::prtoocol::protocol
    ::protocl::protocol
    ::prtoocols::protocols
    ::protocls::protocols
    ::proove::prove
    :*:pesudo::pseudo               ; pseudocode, pseudorandom
    :*:psuedo::pseudo
    :C:push+back::push_back         ; common C++ container function
    ::pythno::python
    ::pyton::python
    ::pythohn::python
    :C:PYthon::Python
    ::pyhton::python

    ::qualyit::quality
    ::quanitty::quantity
    ::queyr::query
    ::queyring::querying
    :*:qustion::question            ; question/s/ed/ing/able
    :*:quetion::question
    ::queu::queue
    ::qeuue::queue
    ::queus::queues
    ::qeuues::queues
    :*:qiuck::quick                 ; quickly, quicksort, quickselect
    ::quicksleect::quickselect

    ::riase::raise
    ::riases::raises
    :*:ranodm::random               ; random/ly/ize/ization
    ::rnage::range
    ::rnages::ranges
    ::rela::real
    ::relaly::really
    ::rebulid::rebuild
    ::rebiuld::rebuild
    ::rebulids::rebuilds
    ::rebiulds::rebuilds
    :*:recognies::recognise         ; recognise/s/ed/er
    :*:recogniez::recognize         ; recognize/s/ed/er
    ::recrod::record
    ::recrods::records
    ::recurrance::recurrence
    :*:recusi::recursi              ; recursi/ve/on/ng/vely
    :*:reudce::reduce               ; reduce/s/d/r
    ::reduceble::reducible
    ::reudction::reduction
    :*:refator::refactor            ; refactor/s/ed/ing
    :*:refernce::reference          ; reference/s/r/d
    ::referal::referral
    ::refersh::refresh
    ::refershes::refreshes
    :*:registser::register          ; register/s/ed/ing
    ::regresion::regression
    ::regresions::regressions
    ::reuglar::regular
    :*:rleation::relation           ; relations, relational, relationships
    ::rleative::relative
    ::releaes::release
    ::releaess::releases
    ::remian::remain
    ::remians::remains
    :*:rmeove::remove               ; remove/s/d/r
    ::reepat::repeat
    ::reepats::repeats
    ::reepated::repeated
    ::repetaed::repeated
    ::reepatedly::repeatedly
    ::repetaedly::repeatedly
    :C:repeelm::repelem             ; common MATLAB function
    :*:repalce::replace             ; replace/s/d/ment/able
    ::repamt::repmat                ; common MATLAB function
    ::repostiroies::repositories
    ::repositoroies::repositories
    ::reposistories::repositories
    ::reopsitories::repositories
    ::repositroies::repositories
    ::repostiroy::repository
    ::repositoroy::repository
    ::reposistory::repository
    ::reopsitory::repository
    ::repositroy::repository
    ::represnet::represent
    ::represnets::represents
    ::represnetation::representation
    ::represnetations::representations
    ::reproducable::reproducible
    :*:requst::request              ; request/s/ed/ing
    :*:reqeust::request
    :*:rquest::request
    :*:reuqest::request
    :*:rqeust::request
    :*:reuqire::require             ; require/s/d/ment
    :*:requrie::require
    :*:requrei::require
    :*:requier::require
    ::requirment::requirement
    ::requirments::requirements
    ::resaerch::research
    ::reserach::research
    ::resarch::research
    :*:rserve::reserve              ; reserve/s/d
    ::reislient::resilient
    ::reoslution::resolution
    ::resoruce::resource
    ::resoruces::resources
    ::respodn::respond
    ::respodns::responds
    ::resopnse::response
    ::respones::response
    ::repsonse::response
    ::resopnses::responses
    ::responess::responses
    ::repsonses::responses
    :*:reuslt::result               ; result/s/ed/ing
    :*:reslut::result
    ::rsult::result
    :*:resutl::result
    ::rsults::results
    ::retrive::retrieve
    ::retrives::retrieves
    :*:reutrn::return               ; return/s/ed/ing
    :*:retrn::return
    :*:retrun::return
    :*:retunr::return
    ::reurn::return
    ::returnd::returned
    :*:retur n::return `            ; ex: 'retur ntrue' (uses ` to add trailing space)
    ::reivew::review
    ::reveiw::review
    ::reivews::reviews
    ::reveiws::reviews
    ::reivsion::revision
    ::reivsions::revisions
    :*:reawrd::reward               ; reward/s/ed/ing
    ::rewriet::rewrite              ; COBOL statement
    :*:rigth::right                 ; right/s, rightInVarName
    :*:rihgt::right
    ::rotue::route
    ::rotuer::router                ; whitelist for -tuer  -> -ture
    ::rotuers::routers              ; whitelist for -tuers -> -tures
    ::runenr::runner
    ::runing::running

    :*:saef::safe                   ; safety, safer, safest
    ::saem::same
    ::smae::same
    ::svae::save
    ::svaes::saves
    ::svaing::saving
    ::scaleable::scalable
    :*:scheudl::schedul             ; schedule/s/d/r, scheduling
    ::shcema::schema
    ::scientiifc::scientific
    :*:scritp::script               ; script/s/ed/ing
    :*:sript::script
    :*:sritp::script
    :*:scirpt::script
    :*:serach::search               ; search/ed/es/ing
    ::escond::second
    ::seocnd::second
    ::esconds::seconds
    ::seocnds::seconds
    ::secuirty::security
    :*:sleect::select               ; select/s/ion/ions
    :*:seelct::select
    ::selectes::selects
    ::slef::self                    ; Python current class instance
    ::sedner::sender
    ::sedners::senders
    :C:SendINput::SendInput         ; common AutoHotkey function
    ::senstivity::sensitivity
    :*:seperat::separat             ; separate, separation, separator
    ::seprate::separate
    ::seuqence::sequence
    ::seuqences::sequences
    ::serivce::service
    ::serivces::services
    ::setapram::setparam            ; Kotlin soft keyword
    ::shaep::shape
    ::shaeps::shapes
    ::shraed::shared
    ::sahred::shared
    :*:shrot::short                 ; short, shortest, shortcut
    ::shortctu::shortcut
    ::shortctus::shortcuts
    ::shoud::should
    ::shoudl::should
    :*:shirnk::shrink               ; shrink/s/ing
    :*:signla::signal               ; signal/s/ed/er/ing
    ::simultaenous::simultaneous
    ::simulatenous::simultaneous
    ::signle::single
    ::singluar::singular
    ::siez::size
    :C:isze::size
    :C:sie_t::size_t                ; common C++ data type
    :C:sizet::size_t
    :C:size_T::size_t
    :C:size-t::size_t
    ::sockte::socket
    ::socktes::sockets
    ::osftware::software
    ::smoe::some
    ::somehing::something
    ::smoething::something
    :*:srot::sort                   ; sort/s/ed/ing/able
    ::soruce::source
    ::soruces::sources
    ::sproadic::sporadic
    ::sproadically::sporadically
    ::spritnf::sprintf              ; common string formatting function
    ::stakc::stack
    ::stnadard::standard
    ::starrt::start
    ::staretd::started
    ::starrted::started
    ::starrts::starts
    ::stahs::stash                  ; git stash
    ::staic::static
    ::sttaic::static
    :C*:std:`;::std`:`:             ; C++ standard namespace. Use '`' to escape ':' and ';'
                                    ; Use '*' to match anywhere. needed b/c there is no ending char after 'std::'
                                    ; 'std:;' -> 'std::'
    :C*:sdt`:`:::std`:`:            ; 'sdt::' -> 'std::'
    :C*:sdt:`;::std`:`:             ; 'sdt:;' -> 'std::'
    :C*:stD`:`:::std`:`:            ; 'stD::' -> 'std::'
    :C*:std`;`:::std`:`:            ; 'std;:' -> 'std::'
    ::stoarge::storage
    ::streategy::strategy
    ::strenghten::strengthen
    ::sring::string
    ::stirng::string
    ::srings::strings
    ::stirngs::strings
    ::strigns::strings
    ::stuct::struct
    ::strcut::struct
    ::struture::structure
    ::strucutre::structure
    ::structrued::structured
    ::styel::style
    ::styels::styles
    ::sytling::styling
    ::subaray::subarray
    ::subarary::subarray
    ::subarrray::subarray
    ::subcateogyr::subcategory
    ::subcatagory::subcategory
    ::subclas::subclass
    ::subexpresison::subexpression
    ::subexpresion::subexpression
    ::submoduel::submodule
    ::submoduels::submodules
    ::subscritp::subscript          ; Swift keyword
    ::subscirpt::subscript
    ::subseuqent::subsequent
    ::subseuqently::subsequently
    ::subsring::substring
    ::substirng::substring
    ::subract::subtract
    :*:sucess::success              ; success/ful/fully/or/ive
    ::succes::success
    ::succesor::successor
    ::successfuly::successfully
    ::succesfully::successfully
    ::sutie::suite                  ; test suite
    ::suties::suites
    :*:suepr::super                 ; super/script/sede
    ::superscritp::superscript
    ::superscirpt::superscript
    :*:siwthc::switch               ; switch/es/ing/case
    :*:siwtch::switch
    :*:swich::switch
    :*:swtich::switch
    :*:synchor::synchro             ; synchronous/ly, synchronized
    ::synchroniation::synchronization
    ::sytnax::syntax
    ::sytnaxes::syntaxes
    :*:sytsem::system               ; system/s/ic/atic
    :*:ssytem::system

    ::tabel::table
    ::tabels::tables
    ::taks::task
    :*:tehcn::techn                 ; technology, technical, technique
    ::techinque::technique
    ::techinques::techniques
    ::tempalte::template
    ::temmplate::template
    ::templae::template
    ::tem[late::template
    ::temlate::template
    ::tempaltes::templates
    ::temmplates::templates
    ::templaes::templates
    ::temlates::templates
    ::tempoarl::temporal
    ::tempoarry::temporary
    ::temoprary::temporary
    ::tendancy::tendency
    ::temrinal::terminal
    ::htan::than
    ::tahn::than
    ::htat::that
    ::taht::that
    :C:hte::the
    :C:teh::the
    :C:Teh::The
    ::thte::the
    ::tjhe::the
    ::tthe::the
    :C:THe::The
    ::thje::the
    ::htem::them
    ::hten::then
    ::theorme::theorem
    ::htere::there
    ::tehre::there
    ::htese::these
    ::thees::these
    ::htey::they
    ::thye::they
    ::theyr'e::they're
    ::thign::thing
    ::htird::third
    ::thikning::thinking
    ::thsi::this
    ::htis::this
    ::tihs::this
    :*:thoguht::thought             ; thought/s/ful/fully
    ::thershold::threshold
    ::throuhg::through
    ::tiem::time
    ::tiems::times
    ::todya::today
    ::tdoay::today
    ::tood`:::todo`:                ; 'tood:' -> 'todo:'
    :*:toekn::token                 ; token/s/ise/izer/isation
    ::tolerence::tolerance
    ::tolernace::tolerance
    ::tolerences::tolerances
    ::tolernaces::tolerances
    ::toolsrip::toolstrip
    ::toplogical::topological
    ::ot be::to be
    ::t obe::to be
    ::ot do::to do
    ::ot the::to the
    ::tothe::to the
    ::t othe::to the
    :*:trnas::trans                 ; transmit, transaction, transfer, transport, translation
    ::transfomer::transformer
    ::transiitive::transitive
    ::transiitively::transitively
    ::travling::traveling
    ::traeling::traveling
    ::traersal::traversal
    ::traersals::traversals
    ::treee::tree
    ::treees::trees
    ::triaeg::triage
    ::ture::true
    :*:trucate::truncate            ; truncate/s/d
    ::tupel::tuple
    ::tyep::type
    ::tyeps::types
    ::tyepalias::typealias          ; Swift keyword
    ::tyepdef::typedef
    :C:typenaem::typename
    :C:tyepof::typeof

    ::undfeined::undefined
    ::undefiend::undefined
    :*:udner::under                 ; underneath, understand/s
    ::uniofrm::uniform
    ::uniofrmly::uniformly
    ::uniformotuput::uniformoutput  ; common MATLAB name/value pair
    ::uniqeu::unique
    ::unqiue::unique
    ::uniqeuly::uniquely
    ::unqiuely::uniquely
    ::unittets::unittest            ; Python testing framework
    ::unkonwn::unknown
    :*:unorderd::unordered          ; unordered_map, unordered_set ('_' is not an AHK end char)
    :*:unordrerd::unordered
    ::unsaef::unsafe
    ::unsgined::unsigned
    ::unsigend::unsigned
    ::unitl::until
    ::utnil::until
    :*:udpate::update               ; update/s/d/r
    :*:upadte::update
    ::upsream::upstream
    ::uesr::user
    ::uesrs::users

    ::vlaid::valid
    :*:vlaue::value                 ; value/s/d
    :*:avlue::value
    :*:vluae::value
    :*:valeu::value
    ::vareiable::variable
    ::varibale::variable
    ::vareiables::variables
    ::varibales::variables
    ::variatn::variant
    ::variatns::variants
    ::vetor::vector
    ::vecotr::vector
    ::vetcor::vector
    ::veirfy::verify
    ::vierfy::verify
    ::verifiy::verify
    ::vesrion::version
    ::vesrions::versions
    ::vetex::vertex
    ::vrey::very
    ::vidoe::video
    ::vidoes::videos
    ::vitual::virtual
    ::virutal::virtual
    :*:viist::visit                 ; visit/s, visitor/s
    :*:viusal::visual               ; visual/s/ly/ise/ize/ized/ization
    :*:visula::visual
    :C:VIsual::Visual               ; Visual Studio
    ::visualiation::visualization
    ::visualiations::visualizations
    ::vodi::void                    ; C data type

    ::watn::want
    :C:wsa::was
    ::wa snot::was not
    ::wans't::wasn't
    ::wan't::wasn't
    ::wasnt'::wasn't
    :*:wtach::watch                 ; watch/ed/es/dog/point
    :*:wieght::weight               ; weight/s/ed
    ::wern't::weren't
    ::whta::what
    ::hwat::what
    ::waht::what
    ::hwen::when
    ::wehn::when
    ::whne::when
    ::whent he::when the
    ::hwere::where
    ::wher ethe::where the
    ::wher eyou::where you
    ::wich::which
    ::hwich::which
    ::whihc::which
    ::hwihc::which
    ::whcih::which
    ::whicht he::which the
    ::whiel::while
    ::hwile::while
    ::whlie::while
    :*:whtie::white                 ; whiteboard, whitelist, whitespace
    ::whoel::whole
    ::iwth::with
    ::wiht::with
    ::wtih::with
    ::witht he::with the
    ::withotu::without
    ::iwthout::without
    ::wihtout::without
    ::wtihout::without
    ::wont'::won't
    ::wo'nt::won't
    ::own't::won't
    ::owrd::word
    ::owrds::words
    :*:owrk::work                   ; workaround, worker, workflow
    ::worht::worth
    ::woudl::would
    ::wouldnt'::wouldn't
    :*:wirte::write                 ; writer, writable, Write-Output
    :*:wriet::write

    ::yaer::year
    :*:yeidl::yield                 ; yield/s/ed/ing
    :*:yeild::yield
    :C:yuo::you
    :C:Yuo::You
    :*:yoru::your                   ; your, yours, yourself
    ::youself::yourself

    :C:zeor::zero
    :C:zeors::zeros

    ; SUFFIX LIST
    ; Autocorrect words which have these endings.
    ; suffix dictionary search tool: https://www.litscape.com/word_tools/ends_with.php)

    :C?:albe::able        ; ex: available, mutable, runnable
    :C?:aegs::ages        ; ex: languages, pages, messages, usages, outages, manages
    :C?:kae::ake          ; ex: make, remake, take, awake
    :C?:kaes::akes
    :C?:aenous::aneous    ; ex: simultaneous, extraneous, instantaneous
    :C?:nat::ant          ; ex: want, important, redundant, instant
    :C?:aetd::ated        ; ex: emulated, obfuscated, encapsulated
    :C?:taion::ation      ; ex: application, optimization, stabilization, mutation
    :C?:taoin::ation
    :C?:aiton::ation
    :C?:autl::ault        ; ex: fault, segfault, default, vault
    :C?:atie::ative       ; ex: native, collaborative, alternative
    :C?:bakc::back        ; ex: callback, playback, fallback
    :C?:bilties::bilities ; ex: abilities, probabilities, availabilities, possibilities
    :C?:blities::bilities
    :C?:bilites::bilities
    :C?:bilty::bility     ; ex: scalability, ability, mutability
    :C?:blity::bility
    :C?:baord::board      ; ex: keyboard, clipboard, dashboard, motherboard
    :C?:borad::board
    :C?:btue::bute        ; ex: attribute, contribute, distribute
    :C?:ctaing::cating    ; ex: locating, replicating, preallocating
    :C?:ctaion::cation    ; ex: education, replication, allocation
    :C?:caction::cation
    :C?:ctiy::city        ; ex: capacity, opacity, scarcity
    :C?:ciyt::city
    :C?:denet::dent       ; ex: independent, descendent, dependent
    :C?:dnet::dent
    :C?:idng::ding        ; ex: offloading, finding, padding
    :C?:donw::down        ; ex: markdown, shutdown, slowdown, teardown
    :C?:odwn::down
    :C?:oeus::eous        ; ex: simultaneous, miscellaneous, advantageous
    :C?:ofrm::form        ; ex: platform, perform, transform
    :C?:garphy::graphy    ; ex: cryptography, photography
    :C?:grahpy::graphy

    :C?:aite::iate        ; ex: exponentiate, initiate, instantiate
    :C?:icla::ical        ; ex: topological, canonical, symmetrical
    :C?:ikc::ick          ; ex: quick, click, pick
    :C?:ikcs::icks
    :C?:ietn::ient        ; ex: gradient, quotient, client
    :C?:igth::ight        ; ex: copyright, height, eight
    :C?:liity::ility      ; ex: probability, stability, feasibility, capability, utility
    :C?:ign::ing          ; ex: running, string, starting, testing, working, learning
                          ; Note: see whitelist at the top for valid -ign words
    :C?:nig::ing
    :C?:oinal::ional      ; ex: conditional, optional, functional
    :C?:ioanl::ional
    :C?:ouis::ious        ; ex: previous, various, dubious, suspicious
    :C?:oius::ious
    :C?:iison::ision      ; ex: decision, collision, revision
    :C?:tiive::itive      ; ex: positive, primitive, repetitive
    :C?:vie::ive          ; ex: generative, active, relative
    :C?:ivley::ively      ; ex: relatively, actively, intrusively
    :C?:iivty::ivity      ; ex: connectivity, sensitivity, productivity, activity
    :C?:iviyt::ivity
    :C?:iezd::ized        ; ex: equalized, synchronized, amortized
    :C?:kaeg::kage        ; ex: package, leakage, linkage, subpackage
    :C?:alble::lable      ; ex: available, callable, scalable
    :C?:ltiy::lity        ; ex: probability, stability, feasibility, capability, utility
    :C?:laod::load        ; ex: overload, download, upload, workload, offload
    :C?:laoded::loaded
    :C?:laoder::loader
    :C?:laods::loads
    :C?:amte::mate        ; ex: approximate, estimate, animate
    :C?:amtes::mates
    :C?:maion::mation     ; ex: information, summation, automation
    :C?:maeg::mage        ; ex: image, reimage, damage
    :C?:menet::ment       ; ex: comment, argument, increment, element, environment, implement
    :C?:emnt::ment
    :C?:emtn::ment
    :C?:metn::ment
    :C?:mnet::ment
    :C?:emnts::ments
    :C?:emtns::ments
    :C?:metns::ments
    :C?:menets::ments
    :C?:meents::ments
    :C?:mnets::ments
    :C?:mzie::mize        ; ex: customize, maximize, optimize, randomize
    :C?:mzied::mized
    :C?:mzies::mizes

    :C?:ntae::nate        ; ex: concatenate, eliminate, alternate
    :C?:naet::nate
    :C?:ntiy::nity        ; ex: infinity, opportunity, sanity
    :C?:tnation::ntation  ; ex: representation, orientation, segmentation
    :C?:oitn::oint        ; ex: powerpoint, breakpoint, disjoint, watchpoint
    :C?:oitns::oints
    :C?:iont::oint
    :C?:ionts::oints
    :C?:oyp::opy          ; ex: copy, entropy, robocopy
    :C?:oudn::ound        ; ex: background, foreground, compound, sound, round
    :C?:oudns::ounds
    :C?:voe::ove          ; ex: remove, move, above
    :C?:paeg::page        ; ex: page, homepage, webpage, stoppage, subpage
    :C?:epr::per          ; ex: developer, cheaper, super
    :C?:opint::point      ; ex: midpoint, breakpoint, checkpoint, logpoint
    :C?:prot::port        ; ex: import, export, support
    :C?:prots::ports
    :C?:raeg::rage        ; ex: coverage, average, storage, leverage
    :C?:raet::rate        ; ex: enumerate, migrate, integrate
    :C?:rtiy::rity        ; ex: security, linearity, parity
    :C?:sehd::shed        ; ex: distinguished, flushed, pushed, published
    :C?:hsing::shing      ; ex: refreshing, publishing, hashing, smashing, flushing
    :C?:saeg::sage        ; ex: message, usage, misusage, myMessage
    :C?:sihp::ship        ; ex: relationship, ownership, spaceship (operator)
    :C?:sihps::ships
    :C?:sino::sion        ; ex: expression, recursion, comprehension, version, permission, dimension
    :C?:soin::sion
    :C?:soins::sions
    :C?:sinos::sions
    :C?:stiy::sity        ; ex: sparsity, necessity, diversity
    :C?:srot::sort        ; ex: sort, mergesort, quicksort
    :C?:sapce::space      ; ex: workspace, backspace, namespace
    :C?:spcae::space

    :C?:taeg::tage        ; ex: advantage, shortage, outage, stage, percentage
    :C?:thc::tch          ; ex: catch, batch, switch
    :C?:thces::tches
    :C?:tenet::tent       ; ex: persistent, content, existent
    :C?:tehr::ther        ; ex: another, either, other, together
    :C?:hting::thing      ; ex: thing, something, anything
    :C?:itme::time        ; ex: lifetime, realtime, uptime, runtime
    :C?:tiem::time
    :C?:itmes::times
    :C?:tiems::times
    :C?:iton::tion        ; ex: function, exception, condition, transaction, authentication
    :C?:tino::tion
    :C?:toin::tion
    :C?:iotn::tion
    :C?:itons::tions
    :C?:tinos::tions
    :C?:toins::tions
    :C?:iotns::tions
    :C?:tiosn::tions
    :C?:itonal::tional    ; ex: directional, functional, positional, conditional
    :C?:ttiy::tity        ; ex: entity, identity, quantity
    :C?:tiyt::tity
    :C?:tuer::ture        ; ex: feature, picture, future
    :C?:tuers::tures
    :C?:utls::ults
    :C?:tued::uted
    :C?:tues::utes
    :C?:tuion::ution      ; ex: execution, resolution, solution
    :C?:veyr::very        ; ex: every, delivery, discovery, recovery
    :C?:vtiy::vity        ; ex: connectivity, sensitivity, productivity
    :C?:wrae::ware        ; ex: software, hardware, shareware
    :C?:owrk::work        ; ex: network, framework, rework
#HotIf
