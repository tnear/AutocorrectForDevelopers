#Requires AutoHotkey v2.0

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Hostrings: https://www.autohotkey.com/docs/v2/Hotstrings.htm
; Suffix dictionary search tool: https://www.litscape.com/word_tools/ends_with.php
; Prefix dictionary search tool: https://www.litscape.com/word_tools/starts_with.php
; Contains dictionary search tool: https://www.litscape.com/word_tools/contains_sequence.php
; :C: = Match case.
; :*: = Ending char not required. Often added to encompass substrings.
;       For example, this rule -> :*:ansewr::answer
;       ...will convert "ansewr" -> "answer" before typing an ending character.
;       This lets it match "answer", "answers", "answered", ...
; :?: = matches inside other words used for suffixes, ex, :?:tign::ting => testign -> testing.
;       The '?' option still needs ending char.

; VSCode 
#HotIf WinActive("ahk_exe Code.exe")
    ; Add '<' and '>'. They are useful for C++ templates.
    ;    note: everything below except '<' and '>' are default AHK end chars:
    #HotString EndChars -()[]{}:;'"/\,.?!`n `t<>
    
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
    :b0:cosign::
    {
    }
    :b0:cosign::
    {
    }
    :b0:deign::
    {
    }
    :b0:design::
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
    :b0:overdesign::
    {
    }
    :b0:realign::
    {
    }
    :b0:reassign::
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
    :b0:sign::
    {
    }
    :b0:sovereign::
    {
    }
    :b0:unalign::
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
    
    ; -vie word suffix whitelist (do not convert these to -ive)
    :b0:vie::
    {
    }
    :b0:movie::
    {
    }
    
    ; -nat word suffix whitelist (do not convert these to -ant)
    :b0:nat::
    {
    }
    :b0:gnat::
    {
    }

    ; whitelist suffixes (only autocorrect these when they appear as suffixes, see bottom of script)
    :b0:aer::
    {
        ; do not convert to -ear
    }
    :b0:aeg::
    {
        ; do not convert to -age
    }
    :b0:aetd::
    {
        ; do not convert to -ated
    }
    :b0:alble::
    {
        ; do not convert to -lable
    }
    :b0:atie::
    {
        ; do not convert to -ative
    }
    :b0:bilties::
    {
        ; do not convert to -bilities
    }
    :b0:bilty::
    {
        ; do not convert to -bility
    }
    :b0:blity::
    {
        ; do not convert to -bility
    }
    :b0:denet::
    {
        ; do not convert to -dent
    }
    :b0:emnt::
    {
        ; do not convert to -ment
    }
    :b0:emnts::
    {
        ; do not convert to -ments
    }
    :b0:epr::
    {
        ; do not convert to -per
    }
    :b0:idng::
    {
        ; do not convert to -ding
    }
    :b0:ikc::
    {
        ; do not convert to -ick
    }
    :b0:ikcs::
    {
        ; do not convert to -icks
    }
    :b0:iton::
    {
        ; do not convert to -tion
    }
    :b0:itons::
    {
        ; do not convert to -tions
    }
    :b0:kae::
    {
        ; do not convert to -ake
    }
    :b0:kaes::
    {
        ; do not convert to -akes
    }
    :b0:liity::
    {
        ; do not convert to -ility
    }
    :b0:menet::
    {
        ; do not convert to -ment
    }
    :b0:metn::
    {
        ; do not convert to -ment
    }
    :b0:metns::
    {
        ; do not convert to -ments
    }
    :b0:mzie::
    {
        ; do not convert to -mize
    }
    :b0:mzies::
    {
        ; do not convert to -mizes
    }
    :b0:nig::
    {
        ; do not convert to -ing
    }
    :b0:oeus::
    {
        ; do not convert to -eous
    }
    :b0:oinal::
    {
        ; do not convert to -ional
    }
    :b0:oitn::
    {
        ; do not convert to -oint
    }
    :b0:oitns::
    {
        ; do not convert to -oints
    }
    :b0:ouis::
    {
        ; do not convert to -ious
    }
    :b0:prot::
    {
        ; do not convert to -port
    }
    :b0:prots::
    {
        ; do not convert to -ports
    }
    :b0:oudn::
    {
        ; do not convert to -ound
    }
    :b0:oyp::
    {
        ; do not convert to -opy
    }
    :b0:soin::
    {
        ; do not convert to -sion
    }
    :b0:taion::
    {
        ; do not convert to -ation
    }
    :b0:thc::
    {
        ; do not convert to -tch
    }
    :b0:thces::
    {
        ; do not convert to -tches
    }
    :b0:tiive::
    {
        ; do not convert to -itive
    }
    :b0:tiy::
    {
        ; do not convert to -ity
    }
    :b0:toin::
    {
        ; do not convert to -tion
    }
    :b0:toins::
    {
        ; do not convert to -tions
    }
    :b0:tues::
    {
        ; do not convert to -utes
    }
    :b0:tuer::
    {
        ; do not convert to -ture
    }
    :b0:tuers::
    {
        ; do not convert to -tures
    }
    :b0:utl::
    {
        ; do not convert to -ult
    }
    :b0:utls::
    {
        ; do not convert to -ults
    }

    ; Autocorrect these values. Basic syntax -> ::oldString::newString
    ::agian::again
    :*:algoirthm::algorithm
    :*:algorihtm::algorithm
    ::almsot::almost
    ::alos::also
    ::alwasy::always
    ::alot::a lot
    ::adn::and
    ::nad::and
    ::anotehr::another
    :*:ansewr::answer
    ::anhyting::anything
    :*:arugment::argument
    ::aray::array
    ::artifiical::artificial
    ::asert::assert
    ::assrt::assert
    ::asssert::assert
    ::asign::assign
    ::asycn::async
    ::atmoic::atomic
    :*:atribute::attribute
    :*:attirbute::attribute
    :*:attirubte::attribute
    ::awiat::await
    :*:bakc::back                   ; backward, backload
    :*:backwrad::backward
    ::baselien::baseline
    ::becaues::because
    ::becasue::because
    ::betwen::between
    ::boundry::boundary
    :*:brnach::branch               ; branched, branching
    :*:braodcast::broadcast
    ::bulid::build
    ::cahce::cache
    ::cahcing::caching
    ::cnadidate::candidate
    ::cna::can
    ::cant::can't
    ::cant'::can't
    ::cateogyr::category
    ::chagne::change
    :*:chekc::check                 ; checkout, checked
    ::clas::class
    ::clss::class
    ::clasdef::classdef
    ::clickc::click
    ::cloen::clone
    ::comit::commit
    ::comited::committed
    ::commited::committed
    ::comapre::compare
    ::complier::compiler            ; 'complier' is a valid but rare word
    :*:comiple::compile
    :*:comopnent::component
    ::composeite::composite
    :*:conenct::connect
    ::consisten::consistent
    ::consistenet::consistent
    :*:consoel::console
    ::cosole::console
    :*:cosnt::const
    :*:constratin::constraint
    :*:constraitn::constraint
    :*:constratint::constraint
    ::constexrp::constexpr
    :*:contianer::container
    :*:contorl::control
    :*:contineu::continue
    ::coudl::could
    ::crahs::crash
    ::carsh::crash
    ::creat::create
    ::customie::customize
    :*:dadta::data
    :*:databse::database
    :*:databaes::database
    ::deafult::default
    :*:dleete::delete
    :*:dpeend::depend               ; dependency, dependence
    ::depenency::dependency
    :*:desing::design
    :*:deveop::develop
    :*:devleop::develop
    ::develoment::development
    :*:dialgo::dialog
    :*:din'dt::didn't
    :*:diference::difference
    ::diferent::different
    ::diretory::directory
    ::diable::disable
    ::distriuted::distributed
    ::doesnt'::doesn't
    ::doens't::doesn't
    ; ::doesnt::doesn't ; interferes with "doesnt'"
    ::doenst::doesn't
    ::doesn ot::does not
    ::dont::don't
    ::doubel::double
    :*:elemtn::element
    :*:elemnt::element
    ::enumeate::enumerate
    ::evenet::event
    ::emtpy::empty
    ::empyt::empty
    ::equivalenet::equivalent
    ::eraes::erase
    :*:eample::example
    :*:examle::example
    :*:excetp::except
    ::excahnge::exchange
    ::exectable::executable
    :*:expresison::expression
    :*:expresion::expression
    :*:exoprt::export
    ::expor::export
    ::facotry::factory
    ::flase::false
    ::fiel::file
    ::finaly::finally
    ::fidn::find
    :*:flaot::float                 ; float, floating-point
    ::foriegn::foreign
    ::foudn::found
    ::firend::friend
    :*:fucntion::function
    ::glboal::global
    ::gradietn::gradient
    ::goot::goto
    :*:gorup::group                 ; group, groups
    :*:gropu::group
    ::heirarchy::hierarchy
    ::hsa::has
    ; ::hwo::how                    ; ambiguous between 'how' and 'who'
    ::implemenation::implementation
    :*:imoprt::import
    ::impot::import
    ::imporant::important
    :*:indpeend::independ           ; independent, independently
    :*:incldue::include
    :*:incdlue::include
    ::idnex::index
    :*:inherti::inherit
    ::isnert::insert
    ::intance::instance
    ::itn::int                      ; integer data type
    ::integerate::integrate
    :*:intelig::intellig
    :*:itner::inter                 ; interface, internal
    ::iosream::iostream
    ::iosteam::iostream
    ::ins't::isn't
    ::itme::item
    :*:isnta::insta                 ; instance, install, instantiate
    ::itereator::iterator
    ::invariatn::invariant
    ::i'ts::it's
    ::i"d::I'd
    ::i"m::I'm
    ::javascritp::javascript
    ::jaascript::javascript
    ::jsut::just
    ::knwo::know
    ::konw::know
    ::lable::label
    ::labmda::lambda
    ::langauge::language
    ::legnth::length
    ::librarry::library
    ::liek::like
    :C:LInux::Linux
    ::lsit::list
    ::maloc::malloc
    ::mnay::many
    ::menas::means
    ::memroy::memory
    :*:mlti::multi                  ; multithreaded
    :*:moduel::module
    ::namespce::namespace
    :*:nerua::neura                 ; neural, neuron
    ::nto::not
    ::nulptr::nullptr
    :*:ojbect::object
    ::ofthe::of the
    ::ofteh::of the
    ::ofhte::of the
    :*:opeator::operator
    ::orignal::original
    ::otehr::other
    :*:otuput::output
    :*:overide::override
    :*:pareamter::parameter
    :*:paraemter::parameter         ; no other common "meter" suffixes
    :*:parameer::parameter
    ::praent::parent
    ::parital::partial
    :*:partiton::partition
    ::passwrod::password
    ::eprf::perf
    ::eprformance::performance
    :*:persit::persist              ; persists, persistent
    ::persistant::persistent
    :*:poitner::pointer
    ::prgama::pragma
    :*:pritn::print                 ; print, printer, printf
    :*:priviledge::privilege
    ::probelm::problem
    ::proeprty::property
    ::propety::property
    ::protocl::protocol
    ::queu::queue
    ::riase::raise
    ::ranodm::random
    ::rnage::range
    ::rela::real
    :*:refernce::reference
    :*:rmeove::remove
    :*:remvoe::remove
    :*:repostiroy::repository
    :*:repositoroy::repository
    ::requet::request
    :*:reuqire::require
    :*:requrie::require
    :*:requrei::require
    :*:reuqire::require
    ::resopnse::response
    ::respones::response
    ::reuslt::result
    ::reslut::result
    ::reutrn::return
    ::retrn::return
    :*:rigth::right                 ; rights, rightVarName
    :*:saef::safe                   ; safety, safest
    ::saem::same
    ::smae::same
    ::svae::save
    :*:scritp::script               ; scripted, scripting
    :*:sript::script
    :*:sritp::script
    :*:serach::search               ; search, searching
    ::sleect::select
    ::serivce::service
    ::shraed::shared
    ::shrot::short
    ::shoud::should
    :*:signla::signal               ; signal, signaling
    :C:sie_t::size_t
    :C:sizet::size_t
    :C:size_T::size_t
    :C:size-t::size_t
    :C:slef::self
    ::stakc::stack
    ::stnadard::standard
    ::stahs::stash
    ::staic::static
    :C*:std:`;::std`:`:             ; "std:;" -> "std::". Use '`:' to escape ':' and '`;' to escape ';'
                                    ; Use '*' to match anywhere (needed because there is no ending char after "std::")
    :C*:sdt`:`:::std`:`:            ; "sdt::" -> "std::"
    :C*:sdt:`;::std`:`:             ; "sdt:;" -> "std::"
    :C*:stD`:`:::std`:`:            ; "stD::" -> "std::"
    ::streategy::strategy
    ::sring::string
    ::stirng::string
    ::stuct::struct
    ::strcut::struct
    ::styel::style
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
    ::htan::than
    ::htat::that
    ::taht::that
    ::hte::the
    ::teh::the
    ::thte::the
    ::hten::then
    ::htere::there
    ::htese::these
    ::htey::they
    ::theyr'e::they're
    ::hting::thing
    ::thsi::this
    ::htis::this
    ::throuhg::through
    ::tiem::time
    ::tolerence::tolerance
    ::toolsrip::toolstrip
    ::ot the::to the
    ::trnasform::transform
    ::ture::true
    :*:trucate::truncate
    ::tupel::tuple
    ::tyep::type
    ::tyepdef::typedef
    :C:typenaem::typename
    :C:tyepof::typeof
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
    :*:vareiable::variable
    ::variatn::variant
    ::vetor::vector
    ::vecotr::vector
    ::vetcor::vector
    ::veirfy::verify
    ::vetex::vertex
    ::vitual::virtual
    ::wans't::wasn't
    ::wan't::wasn't
    ::wasnt'::wasn't
    ::whta::what
    ::hwat::what
    ::wich::which
    ::whiel::while
    ::iwth::with
    ::wiht::with
    ::wsa::was
    ::wont'::won't
    ::woudl::would
    ::wouldnt'::wouldn't
    :*:wirte::write
    :*:yeidl::yield
    :*:yeild::yield
    ::yuo::you
    :*:yoru::your                   ; your, yours, yourself

    ; suffixes (suffix dictionary search tool: https://www.litscape.com/word_tools/ends_with.php)
    :C?:albe::able        ; ex: available, mutable
    :C?:aeg::age          ; ex: image, package
    :C?:aegs::ages        
    :C?:kae::ake          ; ex: make, take
    :C?:kaes::akes        
    :C?:nat::ant          ; ex: want, important, redundant, instant
    :C?:aetd::ated        ; ex: emulated, obfuscated
    :C?:taion::ation      ; ex: application
    :C?:atie::ative       ; ex: native, collaborative
    :C?:bilties::bilities ; ex: probabilities
    :C?:bilty::bility     ; ex: scalability, ability
    :C?:blity::bility     
    :C?:denet::dent       ; ex: independent, descendent
    :C?:idng::ding        ; ex: offloading, finding
    :C?:aer::ear          ; ex: clear, near
    :C?:oeus::eous        ; ex: simultaneous, miscellaneous
    :C?:ikc::ick          ; ex: quick, click, pick
    :C?:ikcs::icks        
    :C?:liity::ility      ; ex: probability, stability
    :C?:ign::ing          ; ex: running, string, starting, testing, working, learning
    :C?:nig::ing          
    :C?:oinal::ional      ; ex: conditional, occasional
    :C?:ouis::ious        ; ex: previous, various
    :C?:tiive::itive      ; ex: positive, primitive
    :C?:tiy::ity          ; ex: security, ability, utility
    :C?:vie::ive          ; ex: generative, active
    :C?:alble::lable      ; ex: available, callable
    :C?:laod::load        ; ex: overload, download
    :C?:amte::mate        ; ex: approximate, estimate
    :C?:amtes::mates      
    :C?:menet::ment       ; ex: comment, document, increment, replacement
    :C?:emnt::ment        ; ex: element, argument, environment
    :C?:emtn::ment        
    :C?:metn::ment        
    :C?:emnts::ments      
    :C?:emtns::ments      
    :C?:metns::ments      ; ex: elements, arguments, environments
    :C?:mzie::mize        ; ex: customize, maximize
    :C?:mzies::mizes      
    :C?:oitn::oint        ; ex: powerpoint, breakpoint
    :C?:oitns::oints      
    :C?:oyp::opy          ; ex: copy, entropy
    :C?:oudn::ound        ; ex: around, compound
    :C?:epr::per          ; ex: developer, cheaper
    :C?:prot::port        ; ex: import, export, support
    :C?:prots::ports      
    :C?:raet::rate        ; ex: enumerate, accelerate
    :C?:soin::sion        ; ex: precision, recursion
    :C?:srot::sort        ; ex: sort, mergesort, quicksort
    :C?:thc::tch          ; ex: catch, batch, switch
    :C?:thces::tches      
    :C?:iton::tion        ; ex: function, definition, condition, transaction
    :C?:tino::tion        
    :C?:toin::tion        
    :C?:itons::tions      
    :C?:tinos::tions      
    :C?:toins::tions      
    :C?:tuer::ture        ; ex: feature, picture
    :C?:tuers::tures      
    :C?:utl::ult          ; ex: result, difficult
    :C?:utls::ults        
    :C?:tue::ute          ; ex: compute, absolute
    :C?:tues::utes        
    :C?:owrk::work        ; ex: network, homework

    ; word middles
    ; substring dictionary: https://www.litscape.com/word_tools/contains_sequence.php
    :?*:ctai::cati        ; ex: educational, allocation, locating

#HotIf
