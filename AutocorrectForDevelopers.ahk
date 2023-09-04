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
#HotIf !WinActive('ahk_exe WINWORD.exe') && !WinActive('ahk_exe soffice.exe')

    ; WHITELIST
    ; Start by listing the whitelist (permit these words by setting backspace to zero, b0)
    ;     Note: the whitelist section must be above suffix section

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

    ; -ouis word suffix whitelist (do not convert these to -ious
    :b0:ouis::
    {
    }
    :b0:louis::
    {
    }

    ; -sino word suffix whitelist (do not convert these to -sion
    :b0:sino::
    {
    }
    :b0:casino::
    {
    }

    ; -sinos word suffix whitelist (do not convert these to -sions
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

    ; -tue word suffix whitelist (do not convert these to -ute)
    :b0:tue::
    {
    }
    :b0:statue::
    {
    }
    :b0:virtue::
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
    :b0:aeg::
    {
        ; do not convert this string to -age
    }
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
    :b0:bilties::
    {
        ; do not convert this string to -bilities
    }
    :b0:bilty::
    {
        ; do not convert this string to -bility
    }
    :b0:blity::
    {
        ; do not convert this string to -bility
    }
    :b0:borad::
    {
        ; do not convert this string to -board
    }
    :b0:cnh::
    {
        ; do not convert this string to -nch
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
    :b0:iotn::
    {
        ; do not convert this string to -tion
    }
    :b0:iotns::
    {
        ; do not convert this string to -tions
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
    :b0:oyp::
    {
        ; do not convert this string to -opy
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
    :b0:taion::
    {
        ; do not convert this string to -ation
    }
    :b0:taoin::
    {
        ; do not convert this string to -ation
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
    :b0:utl::
    {
        ; do not convert this string to -ult
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
    ::abotu::about
    :*:abstarct::abstract           ; abstract/s, abstracted, abstraction/s
    :*:accomodat::accommodat        ; accommodate/s/d, accommodating
    ::activaet::activate
    ::adjacnecy::adjacency
    ::adminstrator::administrator
    ::adminstrators::administrators
    ::agian::again
    ::aehad::ahead
    :*:algoirthm::algorithm         ; algorithms, algorithmic
    :*:algorihtm::algorithm
    :*:algoirhtm::algorithm
    :*:algroithm::algorithm
    ::allcoate::allocate
    ::almsot::almost
    :*:alhpa::alpha                 ; alphabet, alphabetize, alphanumeric
    ::alos::also
    ::alraedy::already
    ::alrady::already
    ::alhtough::although
    ::alwasy::always
    ::analagous::analogous
    :C:adn::and
    :C:Adn::And
    :C:nad::and
    :C:ANd::And
    ::andthe::and the
    ::anotehr::another
    :*:ansewr::answer               ; answer/s, answered
    ::anhyting::anything
    ::appearence::appearance
    ::appearences::appearances
    ::appication::application
    ::appilcation::application
    ::arhitecture::architecture
    ::archtiecture::architecture
    ::arugment::argument
    ::arguement::argument
    ::arugments::arguments
    ::arguements::arguments
    ::arithemtic::arithmetic
    ::aray::array
    ::arary::array
    ::arrray::array
    ::artifiical::artificial
    ::assmebly::assembly
    :*:asert::assert                ; assertion, assertEqual, assertTrue
    :*:assrt::assert
    :*:asssert::assert
    ::assesment::assessment
    ::assesments::assessments
    ::asign::assign
    ::asignment::assignment
    ::asignments::assignments
    ::asigned::assigned
    ::assoicative::associative
    ::asycn::async
    ::atmoic::atomic
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
    ::automted::automated
    ::autoamted::automated
    ::avialable::available
    ::aveareg::average
    ::aveage::average
    ::aveages::averages
    ::awiat::await
    ::alot::a lot
    :*:bakc::back                   ; backward, backload, backspace
    ::backgorund::background
    ::backwrad::backward
    ::backwrads::backwards
    :*:blanace::balance             ; balance/s/d
    ::bandwith::bandwidth
    ::baselien::baseline
    ::baseilne::baseline
    ::becaues::because
    ::becasue::because
    ::becuase::because
    ::begni::begin
    ::behaivor::behavior
    ::benhcmark::benchmark
    ::betwen::between
    ::lbock::block
    ::boht::both
    ::boundries::boundaries
    ::boundry::boundary
    :*:brnach::branch               ; branch/ed/es, branching, branchless
    ::breka::break
    :*:braodcast::broadcast         ; broadcast/s/ed/ing/er
    ::borke::broke
    ::borwser::browser
    ::bulid::build
    ::biuld::build
    ::biult::built
    ::ubndle::bundle
    ::bytearay::bytearray           ; Python built-in type
    ::cahce::cache
    ::cahcing::caching
    ::calcualte::calculate
    ::calender::calendar
    ::calenders::calendars
    ::caleld::called
    :C:cna::can
    :C:Cna::Can
    ::cnadidate::candidate
    ::cannonical::canonical
    ; ::cant::can't ; interferes with "cant'" rule below
    ::cant'::can't
    ::captrue::capture
    ::catpure::capture
    ::cpature::capture
    :C:caes::case                   ; switch-case
    :*:catagor::categor             ; category, categories, categorical
    ::cateogyr::category
    ::cuation::caution
    ::caues::cause
    ::casue::cause
    ::chagne::change
    ::chagnes::changes
    ::chagned::changed
    ::chracter::character
    :*:chekc::check                 ; checkout, checked, checkpoint
    ::chidl::child
    ::chidlren::children
    ::chilren::children
    ::chocie::choice
    ::cihper::cipher
    ::cihpertext::ciphertext
    ::circuti::circuit
    ::clas::class
    ::clss::class
    ::clasdef::classdef
    ::clasifier::classifier
    ::classifer::classifier
    ::clena::clean
    ::claer::clear
    ::clickc::click
    ::clinet::client
    ::cleint::client
    ::clinets::clients
    ::cleints::clients
    ::clcok::clock
    ::cloen::clone
    ::clutser::cluster
    :C:COde::Code                   ; VS Code
    ::colide::collide
    ::colision::collision
    ::comand::command
    ::commnad::command
    ::commadn::command
    ::comands::commands
    ::commnads::commands
    ::commadns::commands
    ::comit::commit
    ::comitment::commitment
    ::comited::committed
    ::commited::committed
    ::comapre::compare
    ::comparision::comparison
    ::compatability::compatibility
    ::compatabilities::compatibilities
    ::compatable::compatible
    ::comiplation::compilation
    :*:comiple::compile             ; compile/r/d/s
    ::complier::compiler            ; 'complier' is a valid but rare word
    ::compileres::compilers
    ::comiler::compiler
    ::compelx::complex
    ::comopnent::component
    ::comopnents::components
    ::compsoe::compose
    ::composeite::composite
    :*:compormis::compromis         ; compromis/e/ed/es/ing
    ::comptuer::computer            ; whitelist for -tuer -> -ture
    ::ocmputer::computer
    ::concatneate::concatenate
    ::concetp::concept              ; C++20 keyword
    ::confidentality::confidentiality
    :*:conenct::connect             ; connect/ed/ion/ing/ions/or
    :*:conect::connect
    ::conseuctive::consecutive
    ::concensus::consensus
    ::considerd::considered
    ::consisten::consistent
    ::consistenet::consistent
    ::consistenyc::consistency
    ::consoel::console
    ::cosole::console
    ::consoe::console
    :*:cosnt::const                 ; const, constant, contructor, constraint
    ::constatn::constant
    ::constexrp::constexpr
    ::constratin::constraint
    ::constraitn::constraint
    ::constriant::constraint
    ::constratins::constraints
    ::constraitns::constraints
    ::constriants::constraints
    ::constuctor::constructor
    ::consuemr::consumer
    :*:contian::contain             ; contains, container
    ::contaienr::container
    :*:contineu::continue           ; continued, continues
    :*:ocntinue::continue
    :*:contirbut::contribut         ; contribute/d, contributor
    :*:contorl::control
    ::convertes::converts
    ::cookei::cookie
    ::copyrgiht::copyright
    :*:corect::correct              ; corrected, correctness
    ::coudl::could
    ::coutn::count
    ::covearge::coverage
    ::coveage::coverage
    ::crahs::crash
    ::carsh::crash
    ::creat::create                 ; note: there exists a legacy C syscall called 'creat'
    ::criteira::criteria
    :*:crytpo::crypto               ; cryptography, cryptographic/ally
    ::curent::current
    ::currenet::current
    ::currrent::current
    ::currenetly::currently
    ::currrently::currently
    ::customie::customize
    ::dahsboard::dashboard
    :*:dadta::data
    :*:databse::database
    :*:databaes::database
    ::dataest::dataset
    ::daedlock::deadlock
    ::deallcoate::deallocate
    ::debuger::debugger
    ::debuging::debugging
    ::decrase::decrease
    ::deepcpoy::deepcopy
    :*:deafult::default             ; default/s/ed
    ::defien::define
    :*:dleete::delete
    :*:dpeend::depend               ; dependency, dependence, dependencies
    :*:depenenc::dependenc
    :*:depht::depth                 ; depth, depthFirstSearch
    :*:detph::depth
    :*:derefernce::dereference      ; dereference/s/d
    :*:descendant::descendent
    ::descrbie::describe
    ::descirbe::describe
    ::desing::design
    ::deisgn::design
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
    :*:dififcult::difficult         ; difficulty, difficulties
    ::dimensinoal::dimensional
    ::dimensinoality::dimensionality
    ::directd::directed
    ::diretory::directory
    ::directoroy::directory
    ::diable::disable
    ::dispaly::display
    :*:distni::distin               ; distinct, distinguish
    ::distriuted::distributed
    ::distriubtion::distribution
    ::distirbution::distribution
    :*:docment::document            ; documents, documented, documentation
    :*:odcument::document
    :*:doucment::document
    ::doesnt'::doesn't
    ::doens't::doesn't
    ::doenst::doesn't
    ::doen'st::doesn't
    ::doesn ot::does not
    ::dont::don't
    ::doubel::double
    ::downsream::downstream
    ::eahc::each
    ::eidtor::editor
    ::ediotr::editor
    ::editro::editor
    :*:eigne::eigen                 ; eigenvalues, eigenvectors, eigenspace
    ::electornic::electronic
    :*:elemtn::element
    :*:elemnt::element
    :*:elmeent::element
    ::elipse::ellipse
    ::ellitpic::elliptic            ; elliptic curve
    ::eliptic::elliptic
    ::esle::else
    ::esleif::elseif
    ::embeded::embedded
    ::emision::emission
    ::emited::emitted
    ::emiting::emitting
    ::emtpy::empty
    ::empyt::empty
    ::emulatro::emulator
    ::enbale::enable
    ::encapuslation::encapsulation
    :C:ENd::End                     ; common Visual Basic keyword
    :*:enahnce::enhance             ; enhance/d/s/ment/ments
    ::enhancment::enhancement
    ::enoguh::enough
    ::enumeate::enumerate
    ::enviroment::environment
    ::envrionment::environment
    ::enviornment::environment
    ::equivalenet::equivalent
    ::equivlent::equivalent
    ::eraes::erase
    :*:evlauat::evaluat             ; evaluate, evaluation
    ::evenet::event
    ::evenets::events
    ::eveyr::every
    ::evvery::every
    ::eveyrone::everyone
    ::everyting::everything
    ::examien::examine
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
    ::excahnge::exchange
    ::exectable::executable
    ::existance::existence
    ::exapnd::expand
    ::expectd::expected
    ::explroer::explorer
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
    ::failrue::failure
    ::failrues::failures
    ::fallthrouhg::fallthrough
    ::flase::false
    :*:feasab::feasib               ; feasible, feasibility
    ::fibonnaci::fibonacci          ; fibonacci sequence, fibonacci heap
    ::fiedl::field
    ; ::fiel::file                  ; ambiguous between: file, field, feel, ...
    ::fiel system::file system
    ::fielsystem::filesystem
    ::finaly::finally
    ::fidn::find
    ::fisrt::first
    ::firsrt::first
    ::flahs::flash
    ::flaot::float
    ::flaoting::floating            ; floating-point
    ::fodler::folder
    ::fodling::folding
    ::folowing::following
    :C:fro::for                     ; 'for' keyword
    :C:ofr::for
    :C:foreeach::foreach            ; Perl keyword
    ::fo rthe::for the
    ::foregorund::foreground
    ::foriegn::foreign
    :C:forSOme::forSome             ; Scala keyword
    ::forwared::forward
    :*:foudn::found                 ; found/ed/ation/ational
    ::founation::foundation
    ::frmaework::framework
    ::firend::friend
    ::forzenset::frozenset
    :*:fucntion::function           ; function/s/al/ality/alities
    :*:funtion::function
    :*:fnction::function
    ::guage::gauge
    ::generatro::generator
    ::glboal::global
    ::goign::going
    ::oging::going
    ::goot::goto
    ::gradiet::gradient
    :C:grammer::grammar             ; case sensitive to exclude 'Grammer' surname
    :*:grpah::graph                 ; graphs, graphing, graphics
    :*:grahp::graph
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
    ::heirarchy::hierarchy
    ; ::hwo::how                    ; ambiguous between 'how' and 'who'
    ::howto::how to
    ::howver::however
    ::hudnred::hundred
    ::hyperparameer::hyperparameter
    ::hyperpareamter::hyperparameter
    ::hyperparaemter::hyperparameter
    ::hyperparmaeter::hyperparameter
    ::iamge::image
    ::implmenet::implement          ; there is a separate -menet suffix rule which should not run
    ::implemenation::implementation
    :*:imoprt::import               ; import/s/ed/er
    ::impot::import
    ::imporant::important
    ::imposible::impossible
    ::imposisble::impossible
    :*:incldue::include             ; include/s/d
    :*:incdlue::include
    ::includ::include
    ::indistniguishable::indistinguishable
    ::indistniguishability::indistinguishability
    :*:infeasab::infeasib           ; infeasible, infeasibility
    ::inifnity::infinity
    :*:inofrmati::informati         ; information, informative, informatics
    ::inclue::include
    ::incrase::increase
    ::increaes::increase
    :*:indpeendent::independent     ; independent, independently
    :*:independant::independent
    :*:idnex::index                 ; indexed, indexing
    ::ineequality::inequality
    :*:inherti::inherit             ; inherits, inheritance
    :*:inhreit::inherit
    :*:intiial::initial             ; initialize/d, initialization
    ::inupt::input
    :*:isnert::insert               ; inserts, insertion
    :*:isnta::insta                 ; instance, install, instantiate
    ::intance::instance
    ::instnace::instance
    ::intances::instances
    ::instnaces::instances
    ::isntead::instead
    ::intsead::instead
    ::isnteadof::insteadof          ; PHP
    :*:isntr::instr                 ; instruction/s, instrument/s
    ::insruction::instruction
    :C:itn::int                     ; integer data type
    ::itneger::integer
    ::integerate::integrate
    ::integerated::integrated
    ::integriy::integrity
    :*:intelig::intellig
    :*:itner::inter                 ; interface, internal
    ::internla::internal
    ::interperet::interpret
    ::interpereter::interpreter
    ::interpeter::interpreter
    ::interupt::interrupt
    :C:inot::into                   ; sql keyword
    ::inthe::in the
    ::invariatn::invariant
    ::ivnariant::invariant
    ::invertable::invertible
    ::i nrange::in range            ; Python loop
    ::iosream::iostream             ; standard C++ I/O header
    ::iosteam::iostream
    ::isotream::iostream
    ::isintance::isinstance         ; common Python function
    ::ins't::isn't
    ::isthe::is the
    ::itme::item
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
    ::knwo::know
    ::konw::know
    ::lable::label
    ::labmda::lambda
    ::lamda::lambda
    ::langauge::language
    ::langague::language
    ::lnaguage::language
    ::lagnuage::language
    ::lnagauge::language
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
    :C:LInux::Linux
    ::lniux::linux
    :*:lsit::list                   ; lists, listen/er/ers
    ::listenr::listener
    ::logairthm::logarithm
    ::lgoical::logical
    ::loign::login
    ::lookaisde::lookaside          ; translation lookaside buffer (TLB)
    ::looop::loop
    ::lwoer::lower
    ::lwoercase::lowercase
    ::mahcine::machine
    ::machien::machine
    ::machins::machines
    ::macintohs::macintosh
    ::maintian::maintain
    :C*:amke_::make_                ; C++: make_shared, make_unique, make_pair, ...
    :C*:mkae_::make_
    :C*:maek_::make_
    ::maloc::malloc
    :*:manfactur::manufactur        ; manufactur/ed/er/ing
    ::mnay::many
    ::marign::margin
    ::mathcing::matching
    ::mathamatics::mathematics
    ::mathmatics::mathematics
    ::mathamatical::mathematical
    ::mathmatical::mathematical
    ::maltab::matlab
    ::amtrix::matrix
    ::menas::means
    ::memroy::memory
    ::mesage::message
    ::messageing::messaging
    ::emtadata::metadata
    ::metadadta::metadata
    ::microsfot::microsoft
    ::mispell::misspell
    ::modle::model
    ::mdoel::model
    ::moduel::module
    ::moduels::modules
    ::mroe::more
    ::omre::more
    :*:mlti::multi                  ; multithreaded, multiplex, multiprocess, multitasking, multiply
    :*:mjulti::multi
    :*:mulitp::multip
    ::nmae::name
    ::namelsit::namelist            ; FORTRAN
    ::namespce::namespace
    ::nmaespace::namespace
    ::namepace::namespace
    ::namepsace::namespace
    ::naer::near
    ::nerual::neural
    ::enxt::next
    ::normlaize::normalize
    :*:northwset::northwest
    :C:nto::not
    ::nulll::null
    ::nulptr::nullptr
    ::nulllptr::nullptr
    :*:ojbect::object               ; object/s, objective/s
    ::ocurred::occurred
    ::occured::occurred
    ::ocurrence::occurrence
    ::occurence::occurrence
    ::occurrance::occurrence
    ::ocurrences::occurrences
    ::occurences::occurrences
    ::occurrances::occurrences
    ::offiical::official
    ::ofthe::of the
    ::ofteh::of the
    ::ofhte::of the
    ::fo the::of the
    ::oft he::of the
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
    ::optimze::optimize
    ::optimiation::optimization
    ::optioal::optional
    ::orignal::original
    ::oriign::origin
    :*:otehr::other                 ; other/s, otherwise
    :*:ohter::other
    ::otheriwse::otherwise
    ::outocme::outcome
    ::otuput::output
    ::ouptut::output
    ::otuputs::outputs
    ::ouptuts::outputs
    ::overlfow::overflow
    ::overiden::overridden
    ::overidden::overridden
    ::overriden::overridden
    ::overide::override             ; cannot do ':*:' b/c of words like overidealize and overidentify
    ::onwer::owner
    ::onwership::ownership
    ::pacakge::package
    ::packge::package
    ::pakcage::package
    ::packte::packet
    ::packtes::packets
    :C:apge::page
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
    ::parital::partial
    :*:partiton::partition          ; partition/s/ed/ing
    ::passwrod::password
    ::pasword::password
    ::passowrd::password
    ::paht::path
    ::pahtlib::pathlib
    ::apttern::pattern
    ::patern::pattern
    ::perceptorn::perceptron
    ::eprf::perf
    ::eprformance::performance
    ::perofrmance::performance
    ::perfomance::performance
    ::permanet::permanent
    ::permenant::permanent
    ::permanant::permanent
    :*:persit::persist              ; persist/s/ed/ent/ing
    ::persistant::persistent
    ::persepctive::perspective
    ::persepctives::perspectives
    ::pertubation::perturbation
    ::pidgeonhole::pigeonhole       ; pigeonhole principle
    ::planend::planned
    ::platfomr::platform
    ::pleae::please
    ::pluign::plugin
    ::poitner::pointer
    ::poitners::pointers
    ::polymorhpic::polymorphic
    ::polynomail::polynomial
    :C:pop+back::pop_back           ; common C++ container function
    ::posible::possible
    ::posisble::possible
    :*:pwoer::power                 ; power/ed, powerpoint, powershell
    ::prgama::pragma                ; #pragma
    ::prealocate::preallocate
    ::predecssor::predecessor
    ::rpedicate::predicate          ; a function returing true/false
    ::preidcate::predicate
    ::prefered::preferred
    ::prefecth::prefetch
    ::rpefix::prefix
    ::prevelant::prevalent
    :*:pritn::print                 ; print, printf, println
    ::privte::private
    :*:privelege::privilege         ; privilege/s/d
    :*:priviledge::privilege
    :*:probelm::problem             ; problems, problematic
    :*:problme::problem
    :*:prblem::problem
    :*:proceudr::procedur           ; procedure/s, procedural/ly
    ::procesing::processing
    ::proflie::profile
    :*:prgoram::program             ; programming, programmable, programmatic
    ::programable::programmable
    ::programatic::programmatic
    :*:proejct::project             ; project/s/ed/ing/ion
    ::proeprty::property
    ::propety::property
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
    ::queyr::query
    ::queyring::querying
    ::quanitty::quantity
    :*:qustion::question
    :*:quetion::question
    ::queu::queue
    :*:qiuck::quick                 ; quickly, quicksort
    ::quicksleect::quickselect
    ::riase::raise
    :*:ranodm::random               ; randomize, randomization
    ::rnage::range
    ::rela::real
    ::relaly::really
    ::rebulid::rebuild
    ::rebiuld::rebuild
    :*:recognies::recognise         ; recognise/s/ed/er
    :*:recogniez::recognize         ; recognize/s/ed/er
    ::recrod::record
    ::recurrance::recurrence
    ::refator::refactor
    :*:refernce::reference          ; reference/s/r/d
    ::referal::referral
    ::refersh::refresh
    :*:registser::register          ; register/s/ed/ing
    ::regresion::regression
    ::reuglar::regular
    :*:rleation::relation           ; relations, relational, relationships
    ::rleative::relative
    ::releaes::release
    ::remian::remain
    :*:rmeove::remove               ; remove/s/d/r
    ::reepat::repeat
    ::reepated::repeated
    :C:repeelm::repelem             ; common MATLAB function
    ::repalce::replace
    :C:repamt::repmat               ; common MATLAB function
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
    ::represnetation::representation
    ::reproducable::reproducible
    ::requst::request
    :*:reuqire::require             ; require/s/d/ment
    :*:requrie::require
    :*:requrei::require
    :*:requier::require
    ::requirment::requirement
    ::resaerch::research
    ::reserach::research
    ::resarch::research
    ::rserve::reserve
    ::resoruce::resource
    ::resoruces::resources
    ::respodn::respond
    ::resopnse::response
    ::respones::response
    :*:reuslt::result               ; result/s/ed/ing
    :*:reslut::result
    ::rsult::result
    ::retrive::retrieve
    ::reutrn::return
    ::retrn::return
    ::retrun::return
    ::reurn::return
    ::returnd::returned
    ::reivew::review
    ::reveiw::review
    ::reivsion::revision
    ::reivsions::revisions
    ::rewriet::rewrite              ; COBOL statement
    :*:rigth::right                 ; rights, rightInVarName
    :*:rihgt::right
    ::rotuer::router                ; whitelist for -tuer
    ::runing::running
    :*:saef::safe                   ; safety, safer, safest
    ::saem::same
    ::smae::same
    ::svae::save
    ::scaleable::scalable
    :*:scheudl::schedul             ; schedule/s/d/r, scheduling
    ::scientiifc::scientific
    :*:scritp::script               ; scripted, scripting
    :*:sript::script
    :*:sritp::script
    :*:scirpt::script
    :*:serach::search               ; search/ed/es/ing
    ::escond::second
    ::seocnd::second
    ::secuirty::security
    ::sleect::select
    ::slef::self                    ; Python current class instance
    ::senstivity::sensitivity
    :*:seperat::separat             ; separate, separation, separator
    ::seuqence::sequence
    ::serivce::service
    ::setapram::setparam            ; Kotlin soft keyword
    ::shaep::shape
    ::shraed::shared
    ::sahred::shared
    :*:shrot::short                 ; short, shortest, shortcut
    ::shortctu::shortcut
    ::shortctus::shortcuts
    ::shoud::should
    ::shoudl::should
    :*:signla::signal               ; signal/s/ed/er/ing
    ::simultaenous::simultaneous
    ::simulatenous::simultaneous
    ::signle::single
    ::siez::size
    :C:sie_t::size_t                ; common C++ data type
    :C:sizet::size_t
    :C:size_T::size_t
    :C:size-t::size_t
    ::socktes::sockets
    ::osftware::software
    ::smoe::some
    ::somehing::something
    ::soudn::sound
    ::soruce::source
    ::sproadic::sporadic
    ::sproadically::sporadically
    ::spritnf::sprintf              ; common string formatting function
    ::stakc::stack
    ::stnadard::standard
    ::staretd::started
    ::stahs::stash                  ; git stash
    ::staic::static
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
    ::sytling::styling
    ::subcateogyr::subcategory
    ::subcatagory::subcategory
    ::subclas::subclass
    ::subexpresison::subexpression
    ::subexpresion::subexpression
    ::subscritp::subscript          ; Swift keyword
    ::subscirpt::subscript
    ::subseuqent::subsequent
    ::subseuqently::subsequently
    ::subsring::substring
    ::substirng::substring
    ::subract::subtract
    :*:sucess::success              ; success/ful/fully/or/ive
    ::succes::success
    ::successfuly::successfully
    ::succesfully::successfully
    ::sutie::suite                  ; test suite
    :*:suepr::super
    ::siwthc::switch
    ::siwtch::switch
    ::swich::switch
    ::swtich::switch
    :*:synchor::synchro             ; synchronous/ly, synchronized
    ::sytnax::syntax
    :*:sytsem::system               ; system/s/ic/atic
    :*:ssytem::system
    ::tabel::table
    ::taks::task
    :*:tehcn::techn                 ; technology, technical, technique
    ::techinque::technique
    ::techinques::techniques
    ::tempalte::template
    ::temmplate::template
    ::templae::template
    ::tem[late::template
    ::temlate::template
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
    :*:thoguht::thought             ; thought/s/ful/fully
    ::thershold::threshold
    ::throuhg::through
    ::tiem::time
    ::tiems::times
    ::todya::today
    ::tdoay::today
    ::tood`:::todo`:                ; 'tood:' -> 'todo:'
    ::tolerence::tolerance
    ::tolernace::tolerance
    ::toolsrip::toolstrip
    ::toplogical::topological
    ::ot be::to be
    ::t obe::to be
    ::ot do::to do
    ::ot the::to the
    ::tothe::to the
    :*:trnas::trans                 ; transmit, transaction, transfer, transport, translation
    ::transfomer::transformer
    ::transiitive::transitive
    ::transiitively::transitively
    ::travling::traveling
    ::traeling::traveling
    ::ture::true
    :*:trucate::truncate            ; truncate/s/d
    ::tupel::tuple
    ::tyep::type
    ::tyepalias::typealias          ; Swift keyword
    ::tyepdef::typedef
    :C:typenaem::typename
    :C:tyepof::typeof
    ::undfeined::undefined
    ::undefiend::undefined
    :*:udner::under                 ; underneath, understand/s
    :C:UniformOtuput::UniformOutput ; common MATLAB name/value pair
    ::uniqeu::unique
    ::unqiue::unique
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
    ::varibales::variabled
    ::variatn::variant
    ::vetor::vector
    ::vecotr::vector
    ::vetcor::vector
    ::veirfy::verify
    ::vierfy::verify
    ::verifiy::verify
    ::vesrion::version
    ::vetex::vertex
    ::veyr::very
    ::vrey::very
    ::vidoe::video
    ::vitual::virtual
    ::virutal::virtual
    :*:viist::visit                 ; visit/s, visitor/s
    ::viusal::visual
    :C:VIsual::Visual               ; Visual Studio
    ::watn::want
    :C:wsa::was
    ::wa snot::was not
    ::wans't::wasn't
    ::wan't::wasn't
    ::wasnt'::wasn't
    :*:wieght::weight               ; weights, weighted
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
    ::whicht he::which the
    ::whiel::while
    ::hwile::while
    ::whlie::while
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

    ; SUFFIX LIST
    ; Autocorrect words which have these endings.
    ; suffix dictionary search tool: https://www.litscape.com/word_tools/ends_with.php)

    :C?:albe::able        ; ex: available, mutable, runnable
    :C?:aeg::age          ; ex: image, package, coverage
    :C?:aegs::ages
    :C?:kae::ake          ; ex: make, remake, take
    :C?:kaes::akes
    :C?:aenous::aneous    ; ex: simultaneous, extraneous, instantaneous
    :C?:nat::ant          ; ex: want, important, redundant, instant
    :C?:aetd::ated        ; ex: emulated, obfuscated, encapsulated
    :C?:taion::ation      ; ex: application, optimization, stabilization
    :C?:taoin::ation
    :C?:atie::ative       ; ex: native, collaborative, alternative
    :C?:bakc::back        ; ex: callback, playback, fallback
    :C?:bilties::bilities ; ex: abilities, probabilities, availabilities, possibilities
    :C?:blities::bilities
    :C?:bilty::bility     ; ex: scalability, ability, mutability
    :C?:blity::bility
    :C?:baord::board      ; ex: keyboard, clipboard, dashboard
    :C?:borad::board
    :C?:ctaing::cating    ; ex: locating, replicating, preallocating
    :C?:ctaion::cation    ; ex: education, replication, allocation
    :C?:caction::cation
    :C?:ctiy::city        ; ex: capacity, opacity, scarcity
    :C?:denet::dent       ; ex: independent, descendent, dependent
    :C?:dnet::dent
    :C?:idng::ding        ; ex: offloading, finding, padding
    :C?:oeus::eous        ; ex: simultaneous, miscellaneous, advantageous
    :C?:ofrm::form        ; ex: platform, perform, transform
    :C?:garphy::graphy    ; ex: cryptography, photography
    :C?:grahpy::graphy
    :C?:hting::thing      ; ex: thing, something, anything
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
    :C?:alble::lable      ; ex: available, callable, scalable
    :C?:ltiy::lity        ; ex: probability, stability, feasibility, capability, utility
    :C?:laod::load        ; ex: overload, download, workload
    :C?:amte::mate        ; ex: approximate, estimate, animate
    :C?:amtes::mates
    :C?:maion::mation     ; ex: information, summation, automation
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
    :C?:chn::nch          ; ex: branch, launch, bunch
    :C?:tnation::ntation  ; ex: representation, orientation, segmentation
    :C?:ntiy::nity        ; ex: infinity, opportunity, sanity
    :C?:oitn::oint        ; ex: powerpoint, breakpoint, disjoint
    :C?:oitns::oints
    :C?:oyp::opy          ; ex: copy, entropy, robocopy
    :C?:oudn::ound        ; ex: background, foreground, compound
    :C?:epr::per          ; ex: developer, cheaper, super
    :C?:prot::port        ; ex: import, export, support
    :C?:prots::ports
    :C?:raet::rate        ; ex: enumerate, migrate, integrate
    :C?:rtiy::rity        ; ex: security, linearity, parity
    :C?:sihp::ship        ; ex: relationship, ownership, spaceship (operator)
    :C?:sihps::ships
    :C?:sino::sion        ; ex: expression, recursion, comprehension, version, permission, dimension
    :C?:soin::sion
    :C?:soins::sions
    :C?:sinos::sions
    :C?:stiy::sity        ; ex: sparsity, necessity, diversity
    :C?:srot::sort        ; ex: sort, mergesort, quicksort
    :C?:sapce::space      ; ex: workspace, backspace, namespace
    :C?:tenet::tent       ; ex: persistent, content, existent
    :C?:thc::tch          ; ex: catch, batch, switch
    :C?:thces::tches
    :C?:iton::tion        ; ex: function, exception, condition, transaction, authentication
    :C?:tino::tion
    :C?:toin::tion
    :C?:iotn::tion
    :C?:itons::tions
    :C?:tinos::tions
    :C?:toins::tions
    :C?:iotns::tions
    :C?:tiosn::tions
    :C?:ttiy::tity        ; ex: entity, identity, quantity
    :C?:tuer::ture        ; ex: feature, picture, future
    :C?:tuers::tures
    :C?:utl::ult          ; ex: result, difficult, default
    :C?:utls::ults
    :C?:tue::ute          ; ex: compute, absolute, permute
    :C?:tues::utes
    :C?:vtiy::vity        ; ex: connectivity, sensitivity, productivity
    :C?:owrk::work        ; ex: network, framework, rework
    :C?:voe::ove          ; ex: remove, move, above
    :C?:wrae::ware        ; ex: software, hardware, shareware
#HotIf
