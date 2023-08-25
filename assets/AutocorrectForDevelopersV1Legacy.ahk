#Requires AutoHotkey v1 ; v1 is supported but it is recommended that everyone upgrade to v2,
; see https://github.com/tnear/AutocorrectForDevelopers
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
;       ...will convert "ansewr" -> "answer" before typing an ending character.
;       This lets it match "answer", "answers", "answered", ...
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
#If !WinActive("ahk_exe WINWORD.exe") && !WinActive("ahk_exe soffice.exe")

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
    :b0:nig::
    {
        ; do not convert this string to -ing
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
    :b0:prot::
    {
        ; do not convert this string to -port
    }
    :b0:prots::
    {
        ; do not convert this string to -ports
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
    :b0:tiy::
    {
        ; do not convert this string to -ity
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
    :b0:wrae::
    {
        ; do not convert this string to -ware
    }

    ; AUTOCORRECT LIST
    ; Autocorrect these strings.
    ; Basic syntax -> ::oldString::newString
    ;
    ::abotu::about
    :*:abstarct::abstract           ; abstract, abstraction
    :*:accomodat::accommodat        ; accommodate, accommodating
    ::activaet::activate
    ::adjacnecy::adjacency
    :*:adminstrator::administrator
    ::agian::again
    :*:algoirthm::algorithm
    :*:algorihtm::algorithm
    ::almsot::almost
    :*:alhpa::alpha                 ; alphabet, alphanumeric
    :*:allpha::alpha
    ::alos::also
    ::alraedy::already
    ::alrady::already
    ::alhtough::although
    ::alwasy::always
    :C:adn::and
    :C:Adn::And
    :C:nad::and
    :C:ANd::And
    ::andthe::and the
    ::anotehr::another
    :*:ansewr::answer
    ::anhyting::anything
    :*:appearence::appearance
    ::arhitecture::architecture
    :*:arugment::argument
    ::arguement::argument
    ::aray::array
    ::artifiical::artificial
    ::assmebly::assembly
    :*:asert::assert
    :*:assrt::assert
    :*:asssert::assert
    :*:assesment::assessment
    ::asign::assign
    :*:asignment::assignment
    ::asigned::assigned
    ::asycn::async
    ::atmoic::atomic
    :*:atribute::attribute
    :*:attirbute::attribute
    :*:attirubte::attribute
    :*:attriubte::attribute
    ::automted::automated
    ::autoamted::automated
    ::avialable::available
    ::aveareg::average
    ::aveage::average
    ::aveages::averages
    ::awiat::await
    ::alot::a lot
    :*:bakc::back                   ; backward, backload
    ::backgorund::background
    :*:backwrad::backward
    :*:blanace::balance
    ::bandwith::bandwidth
    ::baselien::baseline
    ::baseilne::baseline
    ::becaues::because
    ::becasue::because
    ::becuase::because
    ::benhcmark::benchmark
    ::betwen::between
    ::boundry::boundary
    :*:brnach::branch               ; branched, branching
    ::breka::break
    :*:braodcast::broadcast
    ::borke::broke
    ::bulid::build
    ::biuld::build
    ::biult::built
    ::ubndle::bundle
    ::bytearay::bytearray           ; python built-in type
    ::cahce::cache
    ::cahcing::caching
    ::calcualte::calculate
    :*:calender::calendar
    :C:cna::can
    :C:Cna::Can
    ::cnadidate::candidate
    ::cant::can't
    ::cant'::can't
    ::captrue::capture
    ::catpure::capture
    :*:catagor::categor             ; categories, categorical
    ::cateogyr::category
    ::cuation::caution
    ::caues::cause
    ::casue::cause
    ::chagne::change
    ::chagnes::changes
    ::chagned::changed
    ::chracter::character
    :*:chekc::check                 ; checkout, checked
    :*:chidl::child
    ::chilren::children
    ::chocie::choice
    :*:cihper::cipher               ; ciphertext
    ::clas::class
    ::clss::class
    ::clasdef::classdef
    ::clena::clean
    ::claer::clear
    ::clickc::click
    ::cloen::clone
    ::colide::collide
    ::colision::collision
    :*:comand::command
    ::comit::commit
    ::comitment::commitment
    ::comited::committed
    ::commited::committed
    ::comapre::compare
    ::comparision::comparison
    ::compatabilities::compatibilities
    ::compatability::compatibility
    ::compatable::compatible
    :*:comiple::compile
    ::complier::compiler            ; 'complier' is a valid but rare word
    ::comiler::compiler
    :*:comopnent::component
    ::composeite::composite
    ::concetp::concept              ; C++20 keyword
    ::confidentality::confidentiality
    :*:conenct::connect
    ::conect::connect
    ::conected::connected
    ::conseuctive::consecutive
    ::concensus::consensus
    ::considerd::considered
    ::consisten::consistent
    ::consistenet::consistent
    ::consoel::console
    ::cosole::console
    ::consoe::console
    :*:cosnt::const
    ::constatn::constant
    ::constexrp::constexpr
    :*:constratin::constraint
    :*:constraitn::constraint
    :*:constriant::constraint
    ::constuctor::constructor
    :*:contian::contain             ; contains, container
    ::contaienr::container
    :*:contineu::continue           ; continued, continues
    :*:ocntinue::continue
    :*:contirbut::contribut         ; contribute, contrubitor
    :*:contorl::control
    ::convertes::converts
    ::copyrgiht::copyright
    :*:corect::correct              ; corrected, correctness
    ::coudl::could
    ::coutn::count
    ::covearge::coverage
    ::coveage::coverage
    ::crahs::crash
    ::carsh::crash
    ::creat::create                 ; note: there exists a legacy C syscall called "creat"
    ::criteira::criteria
    ::curent::current
    :*:currenet::current            ; currently
    :*:currrent::current
    ::customie::customize
    :*:dahsboard::dashboard
    :*:dadta::data
    :*:databse::database
    :*:databaes::database
    ::dataest::dataset
    ::debuger::debugger
    ::debuging::debugging
    ::decrase::decrease
    ::deepcpoy::deepcopy
    :*:deafult::default             ; defaults
    :*:dleete::delete
    :*:dpeend::depend               ; dependency, dependence
    ::depenency::dependency
    :*:depht::depth                 ; depth, depthFirstSearch
    :*:descendant::descendent
    ::descrbie::describe
    ::descirbe::describe
    ::desing::design
    ::deveop::develop
    :*:devleop::develop
    :*:devloep::develop
    :*:dvelop::develop
    :*:develoep::develop
    ::developr::developer
    ::developrs::developers
    ::developeres::developers
    ::develoment::development
    :*:dialgo::dialog
    ::dictinary::dictionary
    ::dictinoary::dictionary
    ::din'dt::didn't
    ::dind't::didn't
    ::didnt'::didn't
    :*:diference::difference
    ::diferent::different
    :*:dififcult::difficult
    ::directd::directed
    ::diretory::directory
    ::diable::disable
    :*:distni::distin               ; distinct, distinguish
    ::distriuted::distributed
    ::distriubtion::distribution
    ::distirbution::distribution
    ::doesnt'::doesn't
    ::doens't::doesn't
    ; ::doesnt::doesn't             ; interferes with "doesnt'"
    ::doenst::doesn't
    ::doesn ot::does not
    ::doign::doing
    ::dont::don't
    ::doubel::double
    ::downsream::downstream
    ::eahc::each
    :*:eigne::eigen                 ; eigenvalues, eigenvectors
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
    ::enumeate::enumerate
    ::enviroment::environment
    ::envrionment::environment
    ::enviornment::environment
    ::equivalenet::equivalent
    ::equivlent::equivalent
    ::eraes::erase
    :*:evlauat::evaluat             ; evaluate, evaluation
    ::evenet::event
    ::eveyr::every
    ::evvery::every
    ::eveyrone::everyone
    ::everyting::everything
    :*:eample::example
    :*:examle::example
    :*:exaple::example
    :*:exmaple::example
    :*:excetp::except
    ::excahnge::exchange
    ::exectable::executable
    ::existance::existence
    ::exapnd::expand
    ::expectd::expected
    :*:exoprt::export
    ::expor::export
    :*:expresison::expression
    :*:expresion::expression
    ::externla::external
    ::facotry::factory
    :*:failrue::failure
    ::fallthrouhg::fallthrough
    ::flase::false
    :*:feasab::feasib               ; feasible, feasibility
    ::fibonnaci::fibonacci          ; fibonacci sequence, fibonacci heap
    ; ::fiel::file                  ; ambiguous between: file, field, feel, ...
    ::finaly::finally
    ::fidn::find
    ::fisrt::first
    ::firsrt::first
    :*:flaot::float                 ; float, floating-point
    ::folowing::following
    :C:fro::for                     ; 'for' keyword
    :C:ofr::for
    ::foregorund::foreground
    ::foriegn::foreign
    ::forwared::forward
    ::foudn::found
    ::foudnation::foundation
    ::founation::foundation
    ::firend::friend
    ::forzenset::frozenset
    :*:fucntion::function           ; functions, functional
    :*:funtion::function
    :*:fnction::function
    ::guage::gauge
    ::glboal::global
    ::goign::going
    ::goot::goto
    ::gradiet::gradient
    :*:grpah::graph                 ; graphs, graphing
    :*:grahp::graph
    ::gerat::great
    ::gorund::ground
    :*:gorup::group                 ; group, groups
    :*:gropu::group
    :C:hsa::has
    :C:Hsa::Has
    ::hvae::have
    ::ahve::have
    ::heirarchy::hierarchy
    ; ::hwo::how                    ; ambiguous between 'how' and 'who'
    ::howver::however
    ::hudnred::hundred
    ::hyperparameer::hyperparameter
    ::hyperpareamter::hyperparameter
    ::hyperparaemter::hyperparameter
    ::hyperparmaeter::hyperparameter
    ::iamge::image
    ::implemenation::implementation
    :*:imoprt::import
    ::impot::import
    ::imporant::important
    ::imposible::impossible
    ::imposisble::impossible
    :*:incldue::include
    :*:incdlue::include
    :*:indistniguish::indistinguish ; indistinguishable, indistinguishability
    :*:inofrmati::informati         ; information, informative
    ::inclue::include
    ::incrase::increase
    ::increaes::increase
    :*:indpeend::independ           ; independent, independently
    :*:independant::independent
    ::idnex::index
    ::ineequality::inequality
    :*:inherti::inherit
    :*:inhreit::inherit
    :*:intiial::initial             ; initialize, initialization
    ::inupt::input
    ::isnert::insert
    :*:isnta::insta                 ; instance, install, instantiate
    ::intance::instance
    ::isntead::instead
    ::isnteadof::insteadof          ; PHP
    :*:isntr::instr                 ; instruction, instrument
    ::insruction::instruction
    :C:itn::int                     ; integer data type
    ::itneger::integer
    ::integerate::integrate
    ::integriy::integrity
    :*:intelig::intellig
    :*:itner::inter                 ; interface, internal
    ::internla::internal
    ::interperet::interpret
    ::interpereter::interpreter
    ::interupt::interrupt
    :C:inot::into                    ; sql keyword
    ::inthe::in the
    ::invariatn::invariant
    ::ivnariant::invariant
    ::invertable::invertible
    ::i nrange::in range            ; python loop
    ::iosream::iostream
    ::iosteam::iostream
    ::isintance::isinstance         ; common python function
    ::ins't::isn't
    ::isthe::is the
    ::itme::item
    :*:iteation::iteration
    :*:itereation::iteration
    :*:itereator::iterator
    :*:iteator::iterator
    ::i'ts::it's
    ::i"d::i'd
    ::i"ll::i'll
    ::i"m::i'm
    ::i"ve::i've
    :C:javascritp::javascript
    :C:JavaScritp::JavaScript       ; with 2 capital letters, this word does not fit AHK's traditional model
    :C:jaascript::javascript
    :C:JaaScript::JavaScript
    :C:javacript::javascript
    :C:Javacript::JavaScript
    ::jorunal::journal
    ::jsut::just
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
    ::liaiason::liaison
    ::laison::liaison
    ::laiason::liaison
    ::librarry::library
    ::liek::like
    :C:LInux::Linux
    :*:lsit::list                   ; lists, listener
    ::listenr::listener
    ::looop::loop
    :*:lwoer::lower                 ; lower, lowercase
    ::mahcine::machine
    ::machien::machine
    ::machins::machines
    ::maintian::maintain
    :C*:amke_::make_                ; C++: make_shared, make_unique, make_pair, ...
    :C*:mkae_::make_
    ::maloc::malloc
    :*:manfactur::manufactur        ; manufacturing, manufacturer
    ::mnay::many
    :*:mathamatic::mathematic       ; mathematical
    :*:mathmatic::mathematic
    ::maltab::matlab
    ::menas::means
    ::memroy::memory
    ::mesage::message
    ::mispell::misspell
    ::modle::model
    ::mdoel::model
    :*:moduel::module
    ::mroe::more
    ::omre::more
    :*:mlti::multi                  ; multithreaded
    :*:mjulti::multi
    ::nmae::name
    ::namespce::namespace
    ::nmaespace::namespace
    ::naer::near
    :*:nerua::neura                 ; neural, neuralnet
    ::enxt::next
    ::normlaize::normalize
    :*:northwset::northwest
    :C:nto::not
    ::nohting::nothing
    ::nulll::null
    ::nulptr::nullptr
    ::nulllptr::nullptr
    :*:ojbect::object
    ::ocurred::occurred
    ::occured::occurred
    ::ocurrence::occurrence
    ::occurence::occurrence
    ::occurrance::occurrence
    ::offiical::official
    ::ofthe::of the
    ::ofteh::of the
    ::ofhte::of the
    ::fo the::of the
    ::oft he::of the
    ::onthe::on the
    :*:opeation::operation
    :*:operaetion::operation
    :*:opeator::operator
    :*:opeartor::operator
    ::optgorup::optgroup            ; html tag
    ::optgropu::optgroup
    ::optimze::optimize
    ::orignal::original
    ::otehr::other
    :*:otuput::output
    ::overiden::overridden
    ::overidden::overridden
    ::overriden::overridden
    ::overide::override             ; cannot do ':*:' b/c of words like overidealize, overidentify
    ::onwer::owner
    ::onwership::ownership
    :*:packte::packet               ; packets, packetize
    ::paralel::parallel
    ::parllel::parallel
    ::parllle::parallel
    :*:pareamter::parameter
    :*:paraemter::parameter
    :*:parameer::parameter
    :*:parmaeter::parameter
    :*:aprameter::parameter
    :*:paramter::parameter
    ::parameteres::parameters
    ::praent::parent
    ::parenet::parent
    ::parital::partial
    :*:partiton::partition
    ::passwrod::password
    ::pasword::password
    ::passowrd::password
    ::paht::path
    ::pahtlib::pathlib
    ::apttern::pattern
    ::perceptorn::perceptron
    ::eprf::perf
    ::eprformance::performance
    ::perofrmance::performance
    ::perfomance::performance
    ::permanet::permanent
    ::permenant::permanent
    ::permanant::permanent
    :*:persit::persist              ; persists, persistent
    ::persistant::persistent
    :*:persepct::perspect           ; perspective
    ::pertubation::perturbation
    :*:pidgeon::pigeon              ; pigeonhole
    ::planend::planned
    ::platfomr::platform
    ::pleae::please
    :*:poitner::pointer
    ::polynomail::polynomial
    ::posible::possible
    ::posisble::possible
    :*:pwoer::power                 ; powerpoint, powershell
    ::prgama::pragma                ; #pragma
    ::predecssor::predecessor
    ::rpedicate::predicate          ; function returing true/false
    ::preidcate::predicate
    ::prefered::preferred
    ::prevelant::prevalent
    :*:pritn::print                 ; print, printf, println
    ::privte::private
    :*:privelege::privilege
    :*:priviledge::privilege
    :*:probelm::problem             ; problems, problematic
    :*:problme::problem
    :*:prblem::problem
    :*:prgoram::program             ; programming
    ::programable::programmable
    ::programatic::programmatic
    ::proeprty::property
    ::propety::property
    :*:prtoocol::protocol
    ::protocl::protocol
    ::proove::prove
    :*:pesudo::pseudo               ; pseudocode
    ::pythno::python
    ::pyton::python
    ::pythohn::python
    :C:PYthon::Python
    :*:queyr::query                 ; querying
    ::quanitty::quantity
    :*:qustion::question
    :*:quetion::question
    ::queu::queue
    :*:qiuck::quick                 ; quickly, quicksort
    ::quicksleect::quickselect
    ::riase::raise
    ::ranodm::random
    ::rnage::range
    ::rela::real
    ::rebulid::rebuild
    ::rebiuld::rebuild
    ::recrod::record
    ::recurrance::recurrence
    ::refator::refactor
    :*:refernce::reference
    ::referal::referral
    ::refersh::refresh
    :*:registser::register
    ::regresion::regression
    ::reuglar::regular
    ::rleative::relative
    :*:rmeove::remove
    ::reepat::repeat
    ::reepated::repeated
    ::repalce::replace
    :C:repeelm::repelem             ; MATLAB function
    :C:repamt::repmat               ; MATLAB function
    :*:repostiro::repositor         ; repository, repositories
    :*:repositoro::repositor
    :*:reposistor::repositor
    :*:reopsitor::repositor
    :*:repositro::repositor
    ::reproducable::reproducible
    ::requst::request
    :*:reuqire::require
    :*:requrie::require
    :*:requrei::require
    :*:requier::require
    ::requirment::requirement
    ::resaerch::research
    ::reserach::research
    ::resarch::research
    ::resopnse::response
    ::respones::response
    :*:reuslt::result
    :*:reslut::result
    ::retrive::retrieve
    ::reutrn::return
    ::retrn::return
    ::retrun::return
    ::returnd::returned
    ::reivew::review
    ::reveiw::review
    :*:rigth::right                 ; rights, rightInVarName
    ::runing::running
    :*:saef::safe                   ; safety, safest
    ::saem::same
    ::smae::same
    ::svae::save
    ::scaleable::scalable
    :*:scheudl::schedul             ; schedule, scheduling
    ::scientiifc::scientific
    :*:scritp::script               ; scripted, scripting
    :*:sript::script
    :*:sritp::script
    :*:scirpt::script
    :*:serach::search               ; search, searching
    ::escond::second
    ::seocnd::second
    ::sleect::select
    ::slef::self                    ; python current class instance
    :*:seperat::separat             ; separate, separation
    ::seuqence::sequence
    ::serivce::service
    ::shaep::shape
    ::shraed::shared
    ::sahred::shared
    ::shrot::short
    ::shrotest::shortest
    ::shoud::should
    ::shoudl::should
    :*:signla::signal               ; signal, signaling
    ::signle::single
    :C:sie_t::size_t                ; common C++ data type
    :C:sizet::size_t
    :C:size_T::size_t
    :C:size-t::size_t
    ::socktes::sockets
    ::osftware::software
    ::smoe::some
    ::soudn::sound
    :*:sproadic::sporadic           ; sporadically
    ::stakc::stack
    ::stnadard::standard
    ::staretd::started
    ::stahs::stash                  ; git stash
    ::staic::static
    :C*:std:`;::std`::             ; C++ standard namespace. Use '`' to escape ':' and ';'
                                    ; Use '*' to match anywhere. needed b/c there is no ending char after "std::"
                                    ; "std:;" -> "std::"
    :C*:sdt`::::std`::            ; "sdt::" -> "std::"
    :C*:sdt:`;::std`::             ; "sdt:;" -> "std::"
    :C*:stD`::::std`::            ; "stD::" -> "std::"
    ::streategy::strategy
    ::strenghten::strengthen
    :*:sring::string
    :*:stirng::string
    ::stuct::struct
    ::strcut::struct
    ::struture::structure
    ::styel::style
    ::sytling::styling
    ::subcateogyr::subcategory
    ::subcatagory::subcategory
    ::subclas::subclass
    ::subscritp::subscript          ; Swift keyword
    ::subscirpt::subscript
    :*:subseuqent::subsequent
    ::subsring::substring
    ::substirng::substring
    ::subract::subtract
    :*:sucess::success              ; successful
    ::succes::success
    ::sutie::suite                  ; test suite
    :*:suepr::super
    ::siwthc::switch
    ::siwtch::switch
    ::swich::switch
    ::swtich::switch
    :*:synchor::synchro             ; synchronous, synchronized
    :*:sytsem::system
    ::tabel::table
    ::taks::task
    :*:tehcn::techn                 ; technology, technical, technique
    :*:techinque::technique
    ::tempalte::template
    ::temmplate::template
    ::templae::template
    ::tem[late::template
    ::temlate::template
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
    ::htere::there
    ::tehre::there
    ::htese::these
    ::thees::these
    ::htey::they
    ::thye::they
    ::theyr'e::they're
    ::hting::thing
    ::thign::thing
    ::thikning::thinking
    ::thsi::this
    ::htis::this
    :*:thoguht::thought
    ::thershold::threshold
    ::throuhg::through
    ::tiem::time
    ::tiems::times
    ::todya::today
    ::tdoay::today
    ::tolerence::tolerance
    ::tolernace::tolerance
    ::toolsrip::toolstrip
    ::toplogical::topological
    ::ot be::to be
    ::ot do::to do
    ::ot the::to the
    ::tothe::to the
    :*:trnasform::transform
    ::transfomer::transformer
    :*:transiitive::transitive
    ::travling::traveling
    ::traeling::traveling
    ::ture::true
    :*:trucate::truncate
    ::tupel::tuple
    ::tyep::type
    ::tyep::typealias               ; Swift keyword
    ::tyepdef::typedef
    :C:typenaem::typename
    :C:tyepof::typeof
    ::undfeined::undefined
    ::undefiend::undefined
    :*:udner::under                 ; underneath, understand
    ::uniqeu::unique
    ::unqiue::unique
    ::unittets::unittest            ; python testing framework
    ::unkonwn::unknown
    :*:unorderd::unordered
    :*:unordrerd::unordered
    ::unsaef::unsafe
    ::unsgined::unsigned
    ::unitl::until
    ::utnil::until
    :*:udpate::update
    :*:upadte::update
    ::upsream::upstream
    ::vlaid::valid
    :*:vlaue::value
    :*:avlue::value
    :*:vluae::value
    :*:valeu::value
    :*:vareiable::variable
    :*:varibale::variable
    ::variatn::variant
    ::vetor::vector
    ::vecotr::vector
    ::vetcor::vector
    ::veirfy::verify
    ::vesrion::version
    ::vetex::vertex
    ::veyr::very
    ::vitual::virtual
    ::virutal::virtual
    :*:viist::visit                 ; visits, visitor
    ::viusal::visual
    ::watn::want
    :C:wsa::was
    ::wans't::wasn't
    ::wan't::wasn't
    ::wasnt'::wasn't
    :*:wieght::weight               ; weights, weighted
    ::whta::what
    ::hwat::what
    ::hwen::when
    ::wich::which
    ::hwich::which
    ::whihc::which
    ::whiel::while
    ::hwile::while
    ::iwth::with
    ::wiht::with
    ::wtih::with
    ::withotu::without
    ::wont'::won't
    ::wo'nt::won't
    ::own't::won't
    :*:owrkflow::workflow
    ::woudl::would
    ::wouldnt'::wouldn't
    :*:wirte::write
    :*:wriet::write                 ; writer, Write-Output
    ::yaer::year
    :*:yeidl::yield
    :*:yeild::yield
    :C:yuo::you
    :C:Yuo::You
    :*:yoru::your                   ; your, yours, yourself
    ::youself::yourself

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
    :C?:bilties::bilities ; ex: abilities, probabilities, availabilities
    :C?:bilty::bility     ; ex: scalability, ability, mutability
    :C?:blity::bility
    :C?:baord::board      ; ex: keyboard, clipboard, dashboard
    :C?:borad::board
    :C?:ctaing::cating    ; ex: locating, replicating, preallocating
    :C?:ctaion::cation    ; ex: education, replication, allocation
    :C?:caction::cation
    :C?:denet::dent       ; ex: independent, descendent, dependent
    :C?:dnet::dent
    :C?:idng::ding        ; ex: offloading, finding, padding
    :C?:oeus::eous        ; ex: simultaneous, miscellaneous, advantageous
    :C?:ofrm::form        ; ex: platform, perform, transform
    :C?:garphy::graphy    ; ex: cryptography, photography
    :C?:grahpy::graphy
    :C?:icla::ical        ; ex: topological, canonical, symmetrical
    :C?:ikc::ick          ; ex: quick, click, pick
    :C?:ikcs::icks
    :C?:ietn::ient        ; ex: gradient, quotient, client
    :C?:igth::ight        ; ex: copyright, height, eight
    :C?:liity::ility      ; ex: probability, stability, feasibility
    :C?:ign::ing          ; ex: running, string, starting, testing, working, learning
                          ; Note: see whitelist at the top for valid -ign words
    :C?:nig::ing
    :C?:oinal::ional      ; ex: conditional, optional, functional
    :C?:ioanl::ional
    :C?:ouis::ious        ; ex: previous, various, dubious
    :C?:iison::ision      ; ex: decision, collision, revision
    :C?:tiive::itive      ; ex: positive, primitive, repetitive
    :C?:tiy::ity          ; ex: security, ability, utility
    :C?:vie::ive          ; ex: generative, active, relative
    :C?:ivley::ively      ; ex: relatively, actively, intrusively
    :C?:iivty::ivity      ; ex: connectivity, sensitivity, productivity
    :C?:alble::lable      ; ex: available, callable, scalable
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
    :C?:chn::nch          ; ex: branch, launch, bunch
    :C?:tnation::ntation  ; ex: representation, orientation, segmentation
    :C?:oitn::oint        ; ex: powerpoint, breakpoint, disjoint
    :C?:oitns::oints
    :C?:oyp::opy          ; ex: copy, entropy, robocopy
    :C?:oudn::ound        ; ex: background, foreground, compound
    :C?:epr::per          ; ex: developer, cheaper, super
    :C?:prot::port        ; ex: import, export, support
    :C?:prots::ports
    :C?:raet::rate        ; ex: enumerate, migrate, integrate
    :C?:sino::sion        ; ex: expression, recursion, comprehension, version, permission
    :C?:soin::sion
    :C?:soins::sions
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
    :C?:tuer::ture        ; ex: feature, picture, future
    :C?:tuers::tures
    :C?:utl::ult          ; ex: result, difficult, default
    :C?:utls::ults
    :C?:tue::ute          ; ex: compute, absolute, permute
    :C?:tues::utes
    :C?:owrk::work        ; ex: network, framework, rework
    :C?:voe::ove          ; ex: remove, move, above
    :C?:wrae::ware        ; ex: software, hardware, shareware

#If
