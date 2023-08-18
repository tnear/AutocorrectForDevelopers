#Requires AutoHotkey v2.0

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; AHK hotstrings: https://www.autohotkey.com/docs/v2/Hotstrings.htm
;   Prefix dictionary search tool: https://www.litscape.com/word_tools/starts_with.php
;   Suffix dictionary search tool: https://www.litscape.com/word_tools/ends_with.php
; Contains dictionary search tool: https://www.litscape.com/word_tools/contains_sequence.php
; :C: = Match case.
; :*: = Ending char not required. Often added to encompass substrings.
;       For example, this rule -> :*:ansewr::answer
;       ...will convert "ansewr" -> "answer" before typing an ending character.
;       This lets it match "answer", "answers", "answered", ...
; :?: = matches inside other words used for suffixes, ex, :?:tign::ting => testign -> testing.
;       The '?' option still needs ending char.

; Add '<' and '>'. They are useful for C++ templates.
;    note: everything below except '<' and '>' are default AHK end chars:
#HotString EndChars -()[]{}:;'"/\,.?!`n `t<>

; VSCode 
#HotIf WinActive("ahk_exe Code.exe")
    ; whitelist (permit these words by setting backspace to zero, b0)
    ;     note: whitelist section must be above suffix section
    ;     note: newline between '{' and '}' is required
    ; suffix dictionary search tool: https://www.litscape.com/word_tools/ends_with.php

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
    :b0:satie::
    {
    }
    
    ; -nat word suffix whitelist (do not convert these to -ant)
    :b0:nat::
    {
    }
    :b0:gnat::
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
    :b0:aer::
    {
        ; do not convert this string to -ear
    }
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
    :b0:fiical::
    {
        ; do not convert this string to -ficial
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
    :b0:iison::
    {
        ; do not convert this string to -ision
    }
    :b0:ikc::
    {
        ; do not convert this string to -ick
    }
    :b0:ikcs::
    {
        ; do not convert this string to -icks
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
    :b0:menet::
    {
        ; do not convert this string to -ment
    }
    :b0:metn::
    {
        ; do not convert this string to -ment
    }
    :b0:metns::
    {
        ; do not convert this string to -ments
    }
    :b0:mzie::
    {
        ; do not convert this string to -mize
    }
    :b0:mzies::
    {
        ; do not convert this string to -mizes
    }
    :b0:nig::
    {
        ; do not convert this string to -ing
    }
    :b0:ofrm::
    {
        ; do not convert this string to -form
    }
    :b0:oeus::
    {
        ; do not convert this string to -eous
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
    :b0:taion::
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
    :b0:tiy::
    {
        ; do not convert this string to -ity
    }
    :b0:toin::
    {
        ; do not convert this string to -tion
    }
    :b0:toins::
    {
        ; do not convert this string to -tions
    }
    :b0:tues::
    {
        ; do not convert this string to -utes
    }
    :b0:tuer::
    {
        ; do not convert this string to -ture
    }
    :b0:tuers::
    {
        ; do not convert this string to -tures
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

    ; Autocorrect these values.
    ; Basic syntax -> ::oldString::newString
    ;
    :*:abstarct::abstract           ; abstract, abstraction
    :*:accomodat::accommodat        ; accommodate, accommodating
    ::agian::again
    :*:algoirthm::algorithm
    :*:algorihtm::algorithm
    ::almsot::almost
    ::alos::also
    ::alraedy::already
    ::alwasy::always
    ::arhitecture::architecture
    ::alot::a lot
    ::adn::and
    ::nad::and
    ::anotehr::another
    :*:ansewr::answer
    ::anhyting::anything
    :*:arugment::argument
    ::aray::array
    ::assmebly::assembly
    ::asert::assert
    ::assrt::assert
    ::asssert::assert
    ::asign::assign
    ::asycn::async
    ::atmoic::atomic
    :*:atribute::attribute
    :*:attirbute::attribute
    :*:attirubte::attribute
    :*:attriubte::attribute
    ::automted::automated
    ::autoamted::automated
    :*:aveareg::average
    ::aveage::average
    ::aveages::averages
    ::awiat::await
    :*:bakc::back                   ; backward, backload
    ::backgorund::background
    :*:backwrad::backward
    ::bandwith::bandwidth
    ::baselien::baseline
    ::becaues::because
    ::becasue::because
    ::benhcmark::benchmark
    ::betwen::between
    ::boundry::boundary
    :*:brnach::branch               ; branched, branching
    ::breka::break
    :*:braodcast::broadcast
    ::bulid::build
    ::ubndle::bundle
    ::bytearay::bytearray           ; python built-in type
    ::cahce::cache
    ::cahcing::caching
    ::cnadidate::candidate
    ::cna::can
    ::cant::can't
    ::cant'::can't
    ::cateogyr::category
    ::caues::cause
    ::casue::cause
    ::chagne::change
    :*:chidl::child
    :*:chekc::check                 ; checkout, checked
    :*:cihper::cipher               ; ciphertext
    ::clas::class
    ::clss::class
    ::clasdef::classdef
    ::claer::clear
    ::clena::clean
    ::clickc::click
    ::cloen::clone
    ::colide::collide
    ::colision::collision
    ::comit::commit
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
    ::confidentality::confidentiality
    :*:conenct::connect
    ::conect::connect
    ::conected::connected
    ::considerd::considered
    ::consisten::consistent
    ::consistenet::consistent
    :*:consoel::console
    ::cosole::console
    ::consoe::console
    :*:contirbute::contribute
    :*:cosnt::const
    ::constatn::constant
    :*:constratin::constraint
    :*:constraitn::constraint
    :*:constratint::constraint
    ::constexrp::constexpr
    :*:contian::contain             ; contains, container
    :*:contorl::control
    :*:contineu::continue
    ::coudl::could
    ::coutn::count
    ::covearge::coverage
    ::coveage::coverage
    ::crahs::crash
    ::carsh::crash
    ::creat::create                 ; note: there exists a legacy C syscall called "creat"
    ::customie::customize
    :*:dadta::data
    :*:databse::database
    :*:databaes::database
    ::dataest::dataset
    ::debuger::debugger
    ::debuging::debugging
    ::deepcpoy::deepcopy
    :*:deafult::default             ; defaults
    :*:dleete::delete
    :*:dpeend::depend               ; dependency, dependence
    ::depenency::dependency
    :*:descendant::descendent
    ::descrbie::describe
    ::descirbe::describe
    ::desing::design
    :*:deveop::develop
    :*:devleop::develop
    ::develoment::development
    :*:dialgo::dialog
    ::dictinary::dictionary
    ::dictinoary::dictionary
    :*:din'dt::didn't
    :*:diference::difference
    ::diferent::different
    ::diretory::directory
    ::diable::disable
    ::distriuted::distributed
    ::distriubtion::distribution
    ::doesnt'::doesn't
    ::doens't::doesn't
    ; ::doesnt::doesn't             ; interferes with "doesnt'"
    ::doenst::doesn't
    ::doesn ot::does not
    ::doign::doing
    ::dont::don't
    ::doubel::double
    ::eahc::each
    :*:eigne::eigen                 ; eigenvalues, eigenvectors
    :*:elemtn::element
    :*:elemnt::element
    ::ellitpic::elliptic            ; elliptic curve
    ::eliptic::elliptic
    ::esle::else
    ::esleif::elseif
    ::emision::emission
    ::emited::emitted
    ::emiting::emitting
    ::emtpy::empty
    ::empyt::empty
    ::enbale::enable
    ::enumeate::enumerate
    ::equivalenet::equivalent
    ::eraes::erase
    ::evenet::event
    ::eveyr::every
    ::everyting::everything
    :*:eample::example
    :*:examle::example
    :*:exaple::example
    :*:exmaple::example
    :*:excetp::except
    ::excahnge::exchange
    ::exectable::executable
    ::exapnd::expand
    ::expectd::expected
    :*:expresison::expression
    :*:expresion::expression
    :*:exoprt::export
    ::expor::export
    ::facotry::factory
    ::flase::false
    ::fibonnaci::fibonacci          ; fibonacci sequence, fibonacci heap
    ; ::fiel::file                  ; ambiguous between: file, field, feel, ...
    ::finaly::finally
    ::fidn::find
    :*:flaot::float                 ; float, floating-point
    :C:fro::for                     ; 'for' keyword
    ::foriegn::foreign
    ::forwared::forward
    ::foudn::found
    ::firend::friend
    ::forzenset::frozenset 
    :*:fucntion::function           ; functions, functional
    :*:funtion::function
    :*:fnction::function
    ::glboal::global
    ::goign::going
    ::goot::goto
    ::gradiet::gradient
    ::gerat::great
    ::gorund::ground
    :*:gorup::group                 ; group, groups
    :*:gropu::group
    ::heirarchy::hierarchy
    ::hsa::has
    ::hvae::have
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
    :*:indpeend::independ           ; independent, independently
    :*:incldue::include
    :*:incdlue::include
    ::inclue::include
    ::idnex::index
    :*:inherti::inherit
    ::inot::into                    ; sql keyword
    ::isnert::insert
    ::intance::instance
    ::isntead::instead
    ::insruction::instruction
    ::itn::int                      ; integer data type
    ::integerate::integrate
    ::integriy::integrity
    :*:intelig::intellig
    :*:itner::inter                 ; interface, internal
    ::interperet::interpret
    ::interpereter::interpreter
    ::invertable::invertible
    ::i nrange::in range            ; python loop
    ::iosream::iostream
    ::iosteam::iostream
    ::ins't::isn't
    ::itme::item
    :*:isnta::insta                 ; instance, install, instantiate
    ::isintance::isinstance         ; common python function
    :*:iteation::iteration
    :*:itereator::iterator
    :*:iteator::iterator
    ::invariatn::invariant
    ::i'ts::it's
    ::i"d::I'd
    ::i"m::I'm
    ::javascritp::javascript
    ::jaascript::javascript
    ::javacript::javascript
    ::jsut::just
    ::knwo::know
    ::konw::know
    ::lable::label
    ::labmda::lambda
    ::lamda::lambda
    ::langauge::language
    ::legnth::length
    ::lenght::length
    ::liaiason::liaison
    ::laison::liaison
    ::laiason::liaison
    ::librarry::library
    ::liek::like
    :C:LInux::Linux
    :*:lsit::list                   ; lists, listener
    ::listenr::listener
    ::mahcine::machine
    ::machien::machine
    ::maintian::maintain
    ::maloc::malloc
    :*:manfactur::manufactur        ; manufacturing, manufacturer
    ::mnay::many
    ::mathamatics::mathematics
    :*:mathmatic::mathematic
    ::menas::means
    ::memroy::memory
    ::mesage::message
    ::modle::model
    :*:moduel::module
    ::mroe::more
    ::omre::more
    :*:mlti::multi                  ; multithreaded
    :*:mjulti::multi
    ::nmae::name
    ::namespce::namespace
    ::nmaespace::namespace
    :*:nerua::neura                 ; neural, neuralnet
    ::enxt::next
    :C:NoneTYpe::NoneType           ; python built-in data type
    :*:northwset::northwest
    :C:nto::not
    ::nulll::null
    ::nulptr::nullptr
    ::nulllptr::nullptr
    :*:ojbect::object
    ::ocurred::occurred
    ::occured::occurred
    ::ocurrence::occurrence
    ::occurence::occurrence
    ::ofthe::of the
    ::ofteh::of the
    ::ofhte::of the
    :*:opeator::operator
    :*:opeartor::operator
    ::optimze::optimize
    ::orignal::original
    ::otehr::other
    :*:otuput::output
    ::overide::override             ; can't do ':*:' b/c of words like overidealize, overidentify
    ::overiden::overridden
    ::overidden::overridden
    ::overriden::overridden
    ::paralel::parallel
    ::parllel::parallel
    ::parllle::parallel
    :*:pareamter::parameter
    :*:paraemter::parameter
    :*:parameer::parameter
    :*:parmaeter::parameter
    ::parameteres::parameters
    :*:aprameter::parameter
    ::praent::parent
    ::parital::partial
    :*:partiton::partition
    ::passwrod::password
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
    ::pleae::please
    :*:poitner::pointer
    ::polynomail::polynomial
    ::prgama::pragma
    ::predecssor::predecessor
    ::prefered::preferred
    ::prevelant::prevalent
    :*:pritn::print                 ; print, printer, printf, println
    ::privte::private
    :*:priviledge::privilege
    ::probelm::problem
    ::programable::programmable
    ::proove::prove
    ::proeprty::property
    ::propety::property
    ::protocl::protocol
    :*:pesudo::pseudo               ; pseudocode
    ::pythno::python
    ::queu::queue
    :*:qustion::question
    :*:quetion::question
    ::quicksleect::quickselect
    ::riase::raise
    ::ranodm::random
    ::rnage::range
    ::rela::real
    :*:refernce::reference
    ::refersh::refresh
    :*:registser::register
    :*:rmeove::remove
    :*:repostiroy::repository
    :*:repositoroy::repository
    ::reproducable::reproducible
    ::requet::request
    :*:reuqire::require
    :*:requrie::require
    :*:requrei::require
    :*:reuqire::require
    :*:requier::require
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
    ::reivew::review
    :*:rigth::right                 ; rights, rightVarName
    :*:saef::safe                   ; safety, safest
    ::saem::same
    ::smae::same
    ::svae::save
    ::scaleable::scalable
    :*:scritp::script               ; scripted, scripting
    :*:sript::script
    :*:sritp::script
    :*:serach::search               ; search, searching
    ::sleect::select
    ::serivce::service
    ::shaep::shape
    ::shraed::shared
    ::sahred::shared
    ::shrot::short
    ::shoud::should
    :*:signla::signal               ; signal, signaling
    :C:sie_t::size_t                ; Common C++ data type
    :C:sizet::size_t
    :C:size_T::size_t
    :C:size-t::size_t
    :C:slef::self                   ; python current class instance
    ::osftware::software
    ::stakc::stack
    ::stnadard::standard
    ::staretd::started
    ::stahs::stash                  ; git stash
    ::staic::static
    :C*:std:`;::std`:`:             ; C++ standard namespace. Use '`:' to escape ':' and '`;' to escape ';'
                                    ; Use '*' to match anywhere (needed b/c there is no ending char after "std::")
                                    ; "std:;" -> "std::"
    :C*:sdt`:`:::std`:`:            ; "sdt::" -> "std::"
    :C*:sdt:`;::std`:`:             ; "sdt:;" -> "std::"
    :C*:stD`:`:::std`:`:            ; "stD::" -> "std::"
    ::streategy::strategy
    ::strenghten::strengthen
    ::sring::string
    ::stirng::string
    ::stuct::struct
    ::strcut::struct
    ::styel::style
    ::sytling::styling
    ::subclas::subclass
    ::sutie::suite                  ; test suite
    :*:suepr::super
    ::siwthc::switch
    ::siwtch::switch
    ::swich::switch
    ::swtich::switch
    :*:synchor::synchro             ; synchronous, synchronized
    :*:sytsem::system
    ::taks::task
    ::tempalte::template
    ::temmplate::template
    ::templae::template
    ::tem[late::template
    ::temlate::template
    ::tempoarry::temporary
    ::temoprary::temporary
    ::htan::than
    ::htat::that
    ::taht::that
    ::hte::the
    ::teh::the
    ::thte::the
    ::htem::them
    ::hten::then
    ::htese::these
    ::htere::there
    ::htey::they
    ::thye::they
    ::theyr'e::they're
    ::hting::thing
    ::thsi::this
    ::htis::this
    ::thoguht::thought
    ::thershold::threshold
    ::throuhg::through
    ::tiem::time
    ::tolerence::tolerance
    ::toolsrip::toolstrip
    ::toplogical::topological
    ::ot be::to be
    ::ot do::to do
    ::ot the::to the
    ::tothe::to the
    ::trnasform::transform
    ::transiitive::transitive
    ::travling::traveling
    ::traeling::traveling
    ::ture::true
    :*:trucate::truncate
    ::tupel::tuple
    ::tyep::type
    ::tyepdef::typedef
    :C:typenaem::typename
    :C:tyepof::typeof
    :*:udner::under                 ; underneath, understand
    ::undfeined::undefined
    ::undefiend::undefined
    ::uniqeu::unique
    ::unqiue::unique
    ::unkonwn::unknown
    ::unsaef::unsafe
    ::unsgined::unsigned
    ::unitl::until
    ::utnil::until
    :*:unorderd::unordered
    :*:udpate::update
    :*:vlaue::value
    :*:avlue::value
    :*:vluae::value
    :*:valeu::value
    :*:vareiable::variable
    ::variatn::variant
    ::vetor::vector
    ::vecotr::vector
    ::vetcor::vector
    ::veirfy::verify
    ::vesrion::version
    ::vetex::vertex
    ::vitual::virtual
    :*:viist::visit                 ; visits, visitor
    :C:wsa::was
    ::wans't::wasn't
    ::wan't::wasn't
    ::wasnt'::wasn't
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
    ::wont'::won't
    ::wo'nt::won't
    ::own't::won't
    ::woudl::would
    ::wouldnt'::wouldn't
    :*:wirte::write
    :*:yeidl::yield
    :*:yeild::yield
    :C:yuo::you
    :C:Yuo::You
    :*:yoru::your                   ; your, yours, yourself

    ; suffixes (suffix dictionary search tool: https://www.litscape.com/word_tools/ends_with.php)
    :C?:albe::able        ; ex: available, mutable
    :C?:aeg::age          ; ex: image, package
    :C?:aegs::ages        
    :C?:kae::ake          ; ex: make, take
    :C?:kaes::akes        
    :C?:aenous::aneous    ; ex: simultaneous, extraneous
    :C?:nat::ant          ; ex: want, important, redundant, instant
    :C?:aetd::ated        ; ex: emulated, obfuscated
    :C?:taion::ation      ; ex: application
    :C?:atie::ative       ; ex: native, collaborative
    :C?:bakc::back        ; ex: callback, playback
    :C?:bilties::bilities ; ex: probabilities
    :C?:bilty::bility     ; ex: scalability, ability
    :C?:blity::bility     
    :C?:ctaing::cating    ; ex: locating, replicating
    :C?:ctaion::cation    ; ex: education, allocation
    :C?:denet::dent       ; ex: independent, descendent
    :C?:idng::ding        ; ex: offloading, finding
    :C?:aer::ear          ; ex: clear, near
    :C?:oeus::eous        ; ex: simultaneous, miscellaneous
    :C?:fiical::ficial    ; ex: artificial, official
    :C?:ofrm::form        ; ex: platform, perform
    :C?:garphy::graphy    ; ex: cryptography, photography
    :C?:grahpy::graphy
    :C?:icla::ical        ; ex: topological, canonical
    :C?:ikc::ick          ; ex: quick, click, pick
    :C?:ikcs::icks        
    :C?:ietn::ient        ; ex: gradient, quotient
    :C?:liity::ility      ; ex: probability, stability
    :C?:ign::ing          ; ex: running, string, starting, testing, working, learning
                          ; note: see whitelist at the top for exceptions
    :C?:nig::ing          
    :C?:oinal::ional      ; ex: conditional, occasional
    :C?:ouis::ious        ; ex: previous, various
    :C?:iison::ision      ; ex: decision, collision
    :C?:tiive::itive      ; ex: positive, primitive
    :C?:tiy::ity          ; ex: security, ability, utility
    :C?:vie::ive          ; ex: generative, active
    :C?:alble::lable      ; ex: available, callable
    :C?:laod::load        ; ex: overload, download
    :C?:amte::mate        ; ex: approximate, estimate
    :C?:amtes::mates      
    :C?:maion::mation     ; ex: information, summation
    :C?:menet::ment       ; ex: comment, document, increment, replacement
    :C?:emnt::ment        ; ex: element, argument, environment
    :C?:emtn::ment        
    :C?:metn::ment        
    :C?:emnts::ments      
    :C?:emtns::ments      
    :C?:metns::ments      
    :C?:mzie::mize        ; ex: customize, maximize
    :C?:mzies::mizes      
    :C?:chn::nch          ; ex: branch, launch
    :C?:oitn::oint        ; ex: powerpoint, breakpoint
    :C?:oitns::oints      
    :C?:oyp::opy          ; ex: copy, entropy
    :C?:oudn::ound        ; ex: around, compound
    :C?:epr::per          ; ex: developer, cheaper
    :C?:prot::port        ; ex: import, export, support
    :C?:prots::ports      
    :C?:raet::rate        ; ex: enumerate, accelerate
    :C?:sino::sion        ; ex: precision, recursion, comprehension
    :C?:soin::sion        
    :C?:srot::sort        ; ex: sort, mergesort, quicksort
    :C?:tenet::tent       ; ex: persistent, content
    :C?:thc::tch          ; ex: catch, batch, switch
    :C?:thces::tches      
    :C?:iton::tion        ; ex: function, exception, condition, transaction, authentication
    :C?:tino::tion        
    :C?:toin::tion        
    :C?:itons::tions      
    :C?:tinos::tions      
    :C?:toins::tions      
    :C?:iotn::tion
    :C?:iotns::tions
    :C?:tuer::ture        ; ex: feature, picture
    :C?:tuers::tures      
    :C?:utl::ult          ; ex: result, difficult
    :C?:utls::ults        
    :C?:tue::ute          ; ex: compute, absolute
    :C?:tues::utes        
    :C?:owrk::work        ; ex: network, homework
    :C?:voe::ove          ; ex: remove, move
    :C?:wrae::ware        ; ex: software, hardware

#HotIf
