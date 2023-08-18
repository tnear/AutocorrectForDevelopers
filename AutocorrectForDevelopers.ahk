#Requires AutoHotkey v2.0

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; VSCode 
; Hostrings: https://www.autohotkey.com/docs/v1/Hotstrings.htm
; :C: = match case
; :*: = ending char not required (often added to encompass singular and plural: ansewr(s) => answer(s)
; :?: = matches inside other words, ex, :?:al::airline => practical -> practicairline
#IfWinActive ahk_exe Code.exe
    ; all but '<' and '>' are default AHK end chars:
    #Hotstring EndChars -()[]{}:;'"/\,.?!`n `t<>

    ; Automatically fix (autocorrect) these typos:
    ::agian::again
    :*:algoirthm::algorithm
    :*:algorihtm::algorithm
    ::almsot::almost
    ::alos::also
    ::alwasy::always
    ::adn::and
    ::nad::and
    ::anotehr::another
    :*:ansewr::answer
    ::anhyting::anything
    :*:arugment::argument
    ::aray::array
    ::asser t::assert 
    ::asert::assert
    ::assrt::assert
    ::asign::assign
    ::asycn::async
    ::atmoic::atomic
    :*:atribute::attribute
    :*:attirbute::attribute
    :*:attirubte::attribute
    ::awiat::await
    ::bakc::back
    :*:backwrad::backward
    ::becaues::because
    ::betwen::between
    ::bulid::build
    ::cna::can
    ::cant'::can't
    ::chagne::change
    ::chekc::check
    ::clas::class
    ::clasdef::classdef
    ::clickc::click
    ::commenet::comment
    ::comapre::compare
    ::complier::compiler       ; 'complier' is a rare word
    :*:conenct::connect
    ::consisten::consistent
    ::consistenet::consistent
    :*:consoel::console
    :*:cosnt::const
    :*:constratin::constraint
    :*:constraitn::constraint
    :*:constratint::constraint
    ::constexrp::constexpr
    :*:contianer::container
    ::contorl::control
    :*:contineu::continue
    ::coyp::copy
    ::coudl::could
    ::creat::create
    ::customie::customize
    :*:dadta::data
    :*:databse::database
    :*:databaes::database
    ::deafult::default
    :*:dleete::delete
    :*:dpeendenc::dependenc
    :*:deveop::develop
    :*:devleop::develop
    :*:dialgo::dialog
    :*:din'dt::didn't
    :*:diference::difference
    ::diferent::different
    ::diretory::directory
    ::diable::disable
    ::distriuted::distributed
    ::documenet::document
    ::doesnt'::doesn't
    ::doesn ot::does not
    ::dont::don't
    ::doubel::double
    :*:elemtn::element
    :*:elemnt::element
    ::evenet::event
    ::emtpy::empty
    :*:eample::example
    :*:examle::example
    ::excetp::except
    ::exectable::executable
    :*:expresison::expression
    :*:expresion::expression
    :*:exoprt::export
    :*:expor::export
    ::facotry::factory
    ::flase::false
    ::finaly::finally
    ::fidn::find
    ::flaot::float
    ::foriegn::foreign
    ::foudn::found
    ::firend::friend
    :*:fucntion::function
    ::glboal::global
    ::goot::goto
    ::gorup::group
    ::heirarchy::hierarchy
    ::hsa::has
    ; ::hwo::how ; can be confused with 'who'
    ::implemenation::implementation
    :*:imoprt::import
    ::impot::import
    :*:inherti::inherit
    ::iosream::iostream
    ::iosteam::iostream
    :*:incldue::include
    :*:incdlue::include
    ::idnex::index
    ::isnert::insert
    ::intance::instance
    ::itn::int
    ::ins't::isn't
    ::itme::item
    ::itereator::iterator
    ::i'ts::it's
    ::i"d::I'd
    ::i"m::I'm
    ::javascritp::javascript
    ::jsut::just
    ::knwo::know
    ::konw::know
    ::labmda::lambda
    ::legnth::length
    ::librarry::library
    ::liek::like
    :C:LInux::Linux
    ::lsit::list
    :*:mkae::make
    ::maloc::malloc
    ::memroy::memory
    :*:moduel::module
    ::nulptr::nullptr
    :*:ojbect::object
    :*:opeator::operator
    ::orignal::original
    :*:otuput::output
    :*:overide::override
    :*:packaeg::package
    :*:pareamter::parameter
    ::parital::partial
    :*:partiton::partition
    ::passwrod::password
    ::eprf::perf
    :*:poitner::pointer
    ::prgama::pragma
    ::pritnf::printf
    ::probelm::problem
    ::proeprty::property
    ::propety::property
    ::queu::queue
    ::retur n::return 
    ::riase::raise
    ::rnage::range
    :*:refernce::reference
    :*:rmeove::remove
    :*:repostiroy::repository
    :*:repositoroy::repository
    ::requet::request
    :*:reuqire::require
    :*:requrie::require
    :*:requrei::require
    :*:reuqire::require
    ::resopnse::response
    ::svae::save
    ::scritp::script
    ::sript::script
    ::sritp::script
    :*:serach::search
    ::serivce::service
    ::shrot::short
    ::shoud::should
    ::sie_t::size_t
    ::sizet::size_t
    :C:size_T::size_t
    ::stakc::stack
    ::staic::static
    :C*:std:;::std`::   ; "std:;" -> "std::". Use '`::' to escape '::'.
                        ; Use '*' to match anywhere (needed because there typically is no ending char after std::)
    :C*:sdt`::::std`::  ; "sdt::" -> "std::"
    :C*:sdt:;::std`::   ; "sdt:;" -> "std::"
    :C*:stD`::::std`::  ; "stD::" -> "std::". Case sensitive replace
    ::sring::string
    ::stirng::string
    ::strign::string
    ::stuct::struct
    ::strcut::struct
    ::styel::style
    ::siwthc::switch
    ::siwtch::switch
    ::swich::switch
    ::swtich::switch
    :*:synchor::synchro ; synchronous, synchronized
    ::syste m::system 
    :*:sytsem::system
    ::tkae::take
    ::taks::task
    ::hte::the
    ::teh::the
    :*:tempalte::template
    ::tempoarry::temporary
    ::htat::that
    ::theyr'e::they're
    ::thign::thing
    ::tiem::time
    ::trnasform::transform
    ::ture::true
    :*:trucate::truncate
    ::tyep::type
    ::tyepdef::typedef
    ::typenaem::typename
    ::undfeined::undefined
    ::uniqeu::unique
    ::unkonwn::unknown
    ::unsgined::unsigned
    ::unitl::until
    :*:udpate::update
    :*:vlaue::value
    ::avlue::value
    :*:vareiable::variable
    ::vetor::vector
    ::veirfy::verify
    ::vetex::vertex
    ::vitual::virtual
    ::wans't::wasn't
    ::wan't::wasn't
    ::wasnt'::wasn't
    ::whta::what
    ::wich::which
    ::whiel::while
    ::iwth::with
    ::wiht::with
    ::wnat::want
    ::wont'::won't
    ::owrk::work
    ::woudl::would
    ::wouldnt'::wouldn't
    :*:wirte::write
    :*:yeidl::yield
    :*:yeild::yield

    ; suffixes (suffix dictionary search tool: https://www.litscape.com/word_tools/ends_with.php)
    :C?:tiy::ity      ; ex: security, ability, utility
    :C?:metn::ment    ; ex: element, argument, environment
    :C?:emnt::ment    
    :C?:metns::ments  ; ex: elements, arguments, environments
    :C?:emter::meter  ; ex: parameter, diameter
    :C?:oitn::oint    ; ex: powerpoint, breakpoint
    :C?:epr::per      ; ex: developer, cheaper
    :C?:prot::port    ; ex: import, export, support
    :C?:thc::tch      ; ex: catch, batch, switch
    :C?:toin::tion    ; ex: function, definition, condition, transaction
    :C?:tino::tion    
    :C?:iton::tion    
    :C?:utl::ult      ; ex: result, difficult
    :C?:tue::ute      ; ex: compute, absolute
    :C?:owrk::work    ; ex: network, homework
    :C?:nign::ning    ; ex: learning. false positive: "benign"
    :C?:taion::ation  ; ex: application
    :C?:alble::lable  ; ex: available, callable
    :C?:aer::ear      ; ex: clear, near
    :C?:bilty::bility ; ex: scalability
    :C?:thign::thing  ; ex: something, anything
    :C?:mzie::mize    ; ex: customize, maximize
    :C?:oeus::eous    ; ex: simultaneous, miscellaneous
    :C?:amte::mate    ; ex: approximate, estimate
    :C?:kign::king    ; ex: making, taking, breaking
    :C?:tuer::ture    ; ex: feature, picture

    ; C++ shorthand. Note: these require '<' and '>' to be Hotstring ending chars: #Hotstring EndChars -()[]{}:;'"/\,.?!`n `t<>
    ::umap::unordered_map
    ::uset::unordered_set
    ::scast::static_cast

    ; :*b0:<em>::</em>{left 5}   ; uses b0 (backspace 0) to preserve typed "<em>", then appends to make "<em></em>"
                                 ; Then it moves caret left 5 to be inside the tag
    ; :*:<em>::<em></em>{left 5} ; equivalent but doesn't use 'b0'
#IfWinActive
