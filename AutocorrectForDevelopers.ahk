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

    ; -aites word suffix whitelist (do not convert these to -iates)
    :b0:aites::
    {
    }
    :b0:ilvaites::
    {
    }
    :b0:waites::
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

    ; -igns word suffix whitelist (do not convert these to -ings)
    :b0:igns::
    {
    }
    :b0:aligns::
    {
    }
    :b0:arraigns::
    {
    }
    :b0:assigns::
    {
    }
    :b0:campaigns::
    {
    }
    :b0:codesigns::
    {
    }
    :b0:consigns::
    {
    }
    :b0:coreigns::
    {
    }
    :b0:cosigns::
    {
    }
    :b0:countersigns::
    {
    }
    :b0:dealigns::
    {
    }
    :b0:designs::
    {
    }
    :b0:disaligns::
    {
    }
    :b0:eloigns::
    {
    }
    :b0:ensigns::
    {
    }
    :b0:feigns::
    {
    }
    :b0:maligns::
    {
    }
    :b0:misaligns::
    {
    }
    :b0:misassigns::
    {
    }
    :b0:outdesigns::
    {
    }
    :b0:outreigns::
    {
    }
    :b0:overdesigns::
    {
    }
    :b0:preassigns::
    {
    }
    :b0:predesigns::
    {
    }
    :b0:realigns::
    {
    }
    :b0:reassigns::
    {
    }
    :b0:reconsigns::
    {
    }
    :b0:redesigns::
    {
    }
    :b0:reigns::
    {
    }
    :b0:resigns::
    {
    }
    :b0:roadsigns::
    {
    }
    :b0:signs::
    {
    }
    :b0:sovereigns::
    {
    }
    :b0:unaligns::
    {
    }
    :b0:unassigns::
    {
    }
    :b0:underdesigns::
    {
    }
    :b0:undersigns::
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
    :b0:athc::
    {
        ; do not convert this string to -atch
    }
    :b0:athces::
    {
        ; do not convert this string to -atches
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
    :b0:blites::
    {
        ; do not convert this string to -bilities
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
    :b0:caction::
    {
        ; do not convert this string to -cation
    }
    :b0:cactions::
    {
        ; do not convert this string to -cations
    }
    :b0:caion::
    {
        ; do not convert this string to -cation
    }
    :b0:caions::
    {
        ; do not convert this string to -cations
    }
    :b0:cetp::
    {
        ; do not convert this string to -cept
    }
    :b0:cetps::
    {
        ; do not convert this string to -cepts
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
    :b0:enyc::
    {
        ; do not convert this string to -ency
    }
    :b0:garphy::
    {
        ; do not convert this string to -graphy
    }
    :b0:hsing::
    {
        ; do not convert this string to -shing
    }
    :b0:iavte::
    {
        ; do not convert this string to -ivate
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
    :b0:ietns::
    {
        ; do not convert this string to -ients
    }
    :b0:iezd::
    {
        ; do not convert this string to -ized
    }
    :b0:igth::
    {
        ; do not convert this string to -ight
    }
    :b0:iicent::
    {
        ; do not convert this string to -icient
    }
    :b0:iison::
    {
        ; do not convert this string to -ision
    }
    :b0:iisons::
    {
        ; do not convert this string to -isions
    }
    :b0:iivty::
    {
        ; do not convert this string to -ivity
    }
    :b0:inat::
    {
        ; do not convert this string to -iant
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
    :b0:maions::
    {
        ; do not convert this string to -mations
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
    :b0:naets::
    {
        ; do not convert this string to -nates
    }
    :b0:necy::
    {
        ; do not convert this string to -ency
    }
    :b0:nig::
    {
        ; do not convert this string to -ing
    }
    :b0:nigs::
    {
        ; do not convert this string to -ings
    }
    :b0:ntaes::
    {
        ; do not convert this string to -nates
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
    :b0:ofrms::
    {
        ; do not convert this string to -forms
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
    :b0:onit::
    {
        ; do not convert this string to -oint
    }
    :b0:onits::
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
    :b0:rnat::
    {
        ; do not convert this string to -rant
    }
    :b0:rtiy::
    {
        ; do not convert this string to -rity
    }
    :b0:oisn::
    {
        ; do not convert this string to -sion
    }
    :b0:oisns::
    {
        ; do not convert this string to -sions
    }
    :b0:oudn::
    {
        ; do not convert this string to -ound
    }
    :b0:oudns::
    {
        ; do not convert this string to -ounds
    }
    :b0:raeg::
    {
        ; do not convert this string to -rage
    }
    :b0:rvoe::
    {
        ; do not convert this string to -rove
    }
    :b0:rvoes::
    {
        ; do not convert this string to -roves
    }
    :b0:saeg::
    {
        ; do not convert this string to -sage
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
    :b0:svie::
    {
        ; do not convert this string to -sive
    }
    :b0:taeg::
    {
        ; do not convert this string to -tage
    }
    :b0:taion::
    {
        ; do not convert this string to -ation
    }
    :b0:taions::
    {
        ; do not convert this string to -ations
    }
    :b0:taive::
    {
        ; do not convert this string to -ative
    }
    :b0:taoin::
    {
        ; do not convert this string to -ation
    }
    :b0:taoins::
    {
        ; do not convert this string to -ations
    }
    :b0:tatn::
    {
        ; do not convert this string to -tant
    }
    :b0:tatns::
    {
        ; do not convert this string to -tants
    }
    :b0:tehr::
    {
        ; do not convert this string to -ther
    }
    :b0:tenet::
    {
        ; do not convert this string to -tent
    }
    :b0:thces::
    {
        ; do not convert this string to -tches
    }
    :b0:tiing::
    {
        ; do not convert this string to -iting
    }
    :b0:tiive::
    {
        ; do not convert this string to -itive
    }
    :b0:tiives::
    {
        ; do not convert this string to -itives
    }
    :b0:tiosn::
    {
        ; do not convert this string to -tions
    }
    :b0:tiyt::
    {
        ; do not convert this string to -tity
    }
    :b0:tnat::
    {
        ; do not convert this string to -tant
    }
    :b0:tnats::
    {
        ; do not convert this string to -tants
    }
    :b0:tnation::
    {
        ; do not convert this string to -ntation
    }
    :b0:tnations::
    {
        ; do not convert this string to -ntations
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
    :b0:tuions::
    {
        ; do not convert this string to -utions
    }
    :b0:tvie::
    {
        ; do not convert this string to -tive
    }
    :b0:utls::
    {
        ; do not convert this string to -ults
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

    :C:#Include::{#}include         ; directive in C/C++. '#' on RHS must be escaped by enclosing in '{}'
    :C:#Pragma::{#}pragma           ; directive in C/C++
    :C?*:.cmo::.com                 ; top-level domain
    
    ::abotu::about
    ::abvoe::above
    ::absoltue::absolute
    :*:abstarct::abstract           ; abstract/s, abstracted, abstraction/s
    :*:accomodat::accommodat        ; accommodate/s/d, accommodating
    ::accruacy::accuracy
    ::accruate::accurate
    :*:acknowlege::acknowledge      ; acknowledge/d/s/ment/ments
    :*:acknwoledge::acknowledge
    :*:ackonwledge::acknowledge
    ::activaet::activate
    ::actula::actual
    ::acutal::actual
    ::adjancecy::adjacency
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
    ::alvie::alive
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
    ::appedn::append
    ::appication::application
    ::appilcation::application
    ::appications::applications
    ::appilcations::applications
    ::arhitecture::architecture
    ::archtiecture::architecture
    ::archvie::archive
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
    :*:asserrt::assert
    ::assesment::assessment
    ::assesments::assessments
    ::asign::assign
    ::asisgn::assign
    ::asigns::assigns
    ::asisgns::assigns
    ::asignment::assignment
    ::asignments::assignments
    ::asigned::assigned
    :*:assocait::associat           ; ex: associat/e/es/ing/ive
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
    ::awkae::awake
    ::alot::a lot

    :*:bakc::back                   ; backward, backload, backspace
    ::backgorund::background
    ::backgournd::background
    ::backwrad::backward
    ::backwrads::backwards
    :*:blanace::balance             ; balance/s/d
    :*:blaance::balance
    ::bandwith::bandwidth
    ::badnwidth::bandwidth
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
    ::bniary::binary
    ::ibnary::binary
    ::lbock::block
    ::bolean::boolean
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
    ::brwoser::browser
    ::borwsers::browsers
    ::brwosers::browsers
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
    :*:calcualt::calculat           ; calculat/e/ed/es/or/ion
    :*:caluclat::calculat
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
    :*:chracter::character          ; character/s/ize/istic
    ::cheaepr::cheaper
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
    ::clikc::click
    ::clickcs::clicks
    ::clikcs::clicks
    ::clinet::client
    ::cleint::client
    ::clienet::client
    ::clinets::clients
    ::cleints::clients
    ::clienets::clients
    ::clcok::clock
    ::clcoks::clocks
    ::cloen::clone
    ::cloens::clones
    ::clsoe::close
    ::clsoed::closed
    ::clodu::cloud
    :*:clutser::cluster             ; cluster/s/ed/ing
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
    :*:commite::committe           ; ex: committe/d/r/rs/e/es
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
    ::comopsition::composition
    :*:compormis::compromis         ; compromis/e/ed/es/ing
    ::comptue::compute
    ::comptuer::computer            ; whitelist for -tuer -> -ture
    ::ocmputer::computer
    ::comptuers::computers
    ::ocmputers::computers
    ::concatneate::concatenate
    ::concatneates::concatenates
    ::conceptula::conceptual
    ::conceputal::conceptual
    ::confidentality::confidentiality
    :*:ocnfig::config               ; config/ure/urable/uration
    :*:conenct::connect             ; connect/s/ed/ion/ing/ions/or
    :*:conect::connect
    ::conseuctive::consecutive
    ::consectuive::consecutive
    ::concensus::consensus
    ::considerd::considered
    :*:consitsen::consisten         ; consistent, consistency, consistently
    :*:conssiten::consisten
    ::consistenet::consistent
    ::consitent::consistent
    ::consitency::consistency
    ::consoel::console
    ::cosole::console
    ::consoe::console
    ::conosle::console
    :*:cosnt::const                 ; const, constant, contructor, constraint
    :*:conts::const
    :*:ocnst::const
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
    ::coordiante::coordinate
    ::coordiantes::coordinates
    ::cpoy::copy
    ::coyp::copy
    ::copyrgiht::copyright
    :*:corect::correct              ; correct/ed/ion/tly/ness
    :*:corretc::correct
    ::corresopnd::correspond
    ::correspodn::correspond
    ::corresopnds::corresponds
    ::correspodns::corresponds
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
    ::cralwer::crawler              ; web crawler
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

    ::damaeg::damage
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
    ::dependnet::dependent
    :*:depht::depth                 ; depth, depthFirstSearch
    :*:detph::depth
    :*:derefernce::dereference      ; dereference/s/d
    ::dervie::derive
    ::descendnat::descendant
    ::descrbie::describe
    ::descirbe::describe
    ::descrbies::describes
    ::descirbes::describes
    ::desing::design
    ::deisgn::design
    ::deisng::design
    ::desings::designs
    ::deisgns::designs
    ::deisngs::designs
    ::deteminant::determinant
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
    ::diagnoal::diagonal
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
    ::difficluty::difficulty
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
    ::distirbuted::distributed
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
    ::drvie::drive

    ::eahc::each
    ::easeir::easier
    ::eidtor::editor
    ::ediotr::editor
    ::editro::editor
    ::edidtor::editor
    ::eidtors::editors
    ::ediotrs::editors
    ::editros::editors
    ::edidtors::editors
    :*:eigne::eigen                 ; eigenvalues, eigenvectors, eigenspace
    ::electornic::electronic
    ::electornics::electronics
    :*:elemtn::element              ; element/s/al/ary
    :*:elemnt::element
    :*:elmeent::element
    :*:elmeetn::element
    :*:elment::element
    ::elipse::ellipse
    ::ellitpic::elliptic            ; elliptic curve
    ::eliptic::elliptic
    ::esle::else
    ::esleif::elseif
    ::elsei f::else if
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
    :*:ential::entail               ; ential/s/ed/ing/ment
    ::entroyp::entropy
    ::enumeate::enumerate
    ::enumeates::enumerates
    ::envrion::environ              ; Python's 'os.environ' parameter
    ::enviorn::environ
    ::envirno::environ
    ::enviroment::environment
    ::envrionment::environment
    ::enviornment::environment
    ::envirnoment::environment
    ::euation::equation
    ::eqeuation::equation
    ::equateion::equation
    ::euations::equations
    ::eqeuations::equations
    ::equateions::equations
    ::equivalenet::equivalent
    ::equivlent::equivalent
    ::eraes::erase
    ::errror::error
    ::errrors::errors
    :*:evlauat::evaluat             ; evaluate/d/s, evaluati/ng/on
    ::evenet::event
    ::evenets::events
    ::eventula::eventual
    ::evenutal::eventual
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
    ::expanison::expansion
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
    ::fkae::fake
    ::favoriet::favorite
    ::favoriets::favorites
    ::failrue::failure
    ::failrues::failures
    ::fallthrouhg::fallthrough
    ::flase::false
    ::aflse::false
    :*:feasab::feasib               ; feasible, feasibly, feasibility
    ::fethc::fetch
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
    ::fo rteh::for the
    ::foregorund::foreground
    ::foregournd::foreground
    ::foriegn::foreign
    :C:forSOme::forSome             ; Scala keyword
    ::forwared::forward
    :*:foudn::found                 ; found/ation/ational
    ::founation::foundation
    ::fpritnf::fprintf              ; common file formatting function
    :*:framgent::fragment           ; fragment/s/ed/ing/ation
    ::frmae::frame
    ::frmaes::frames
    ::frmaework::framework
    :*:freuqen::frequen             ; frequen/t/cy/tly
    ::firend::friend
    ::freind::friend
    ::firends::friends
    ::freinds::friends
    ::forzenset::frozenset
    :*:fucntion::function           ; function/s/al/ality/alities
    :*:funtion::function
    :*:fnction::function
    ::functioal::functional
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
    ::glithc::glitch
    ::glboal::global
    ::gvie::give
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
    ::gournd::ground
    :*:gorup::group                 ; group/s/ed/ing
    :*:gropu::group

    :C:hsa::has
    :C:Hsa::Has
    ::hvae::have
    ::ahve::have
    ::haev::have
    ::have'nt::haven't
    ::havn'et::haven't
    ::havne't::haven't
    ::ahven't::haven't
    ::hvaen't::haven't
    ::haevn't::haven't
    ::haven'et::haven't
    ::hieght::height
    ::heruistic::heuristic
    ::heruistics::heuristics
    ::hiddne::hidden
    ::heirarchy::hierarchy
    ::hihger::higher
    ::hoem::home
    ::howto::how to
    ::howver::however
    ::humna::human
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
    ::imaeg::image
    ::iamges::images
    :*:imblanace::imbalance         ; imbalance/s/d
    :*:imblaance::imbalance
    ::impereative::imperative
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
    ::inclsive::inclusive
    ::indistniguishable::indistinguishable
    ::indistniguishability::indistinguishability
    :*:infeasab::infeasib           ; infeasible, infeasibility
    ::inifnity::infinity
    :*:inofrmati::informati         ; information, informative, informatics
    :*:ifnormati::informati
    ::incrase::increase
    ::increaes::increase
    ::incrases::increases
    ::indpeendent::independent
    ::independant::independent
    ::independnet::independent
    ::indpeendently::independently
    ::independantly::independently
    ::independnetly::independently
    :*:idnex::index                 ; index/ed/es/ing
    ::ineequality::inequality
    :*:inherti::inherit             ; inherit/s/ance
    :*:inhreit::inherit
    :*:intiial::initial             ; initial, initialize/d, initialization
    :*:inital::initial
    ::inupt::input
    ::inptu::input
    ::intput::input
    ::inupts::inputs
    ::inptus::inputs
    ::intputs::inputs
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
    ::intractible::intractable
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
    ::lsit::list
    ::lsits::lists
    :*:lsiten::listen               ; listen/s/er/ers/ing
    ::listenr::listener
    ::listenrs::listeners
    ::lvie::live
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
    ::mahcines::machines
    ::machiens::machines
    ::macintohs::macintosh
    ::maintian::maintain
    ::maintians::maintains
    ::mkae::make
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
    ::menat::meant
    ::memoiation::memoization
    :*:memroi::memori               ; memori/ze/sed/zation
    ::memroy::memory
    ::mrege::merge
    ::emrge::merge
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
    ::msot::most
    ::mvoe::move
    ::muhc::much
    :*:mlti::multi                  ; multithreaded, multiplex, multiprocess, multitasking, multiply
    :*:mjulti::multi
    :*:mulitp::multip
    ::multipel::multiple
    ::multipleir::multiplier
    ::msut::must
    ::mutula::mutual

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
    :C:ndoe::node
    ::ondes::nodes
    ::ndoes::nodes
    ::normlaize::normalize
    ::normlaizes::normalizes
    :*:northwset::northwest
    :C:nto::not
    ::notifcation::notification
    ::ntoes::notes
    ::nulll::null
    ::nulptr::nullptr
    ::nulllptr::nullptr
    :*:nuemr::numer                 ; ex: numerator, numeric, numeral

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
    ::optgorup::optgroup            ; HTML tag
    ::optgropu::optgroup
    ::otpimal::optimal
    ::optiaml::optimal
    ::optimiation::optimization
    ::optimiations::optimizations
    ::optimze::optimize
    ::optimzes::optimizes
    :*:otpion::option               ; option/s/al/ally
    ::optioal::optional
    ::optinoally::optionally
    ::odrer::order
    ::odrers::orders
    ::ordianry::ordinary
    ::orignal::original
    ::oriign::origin
    :*:orhto::ortho                 ; orthogonal/ise/ities, orthonormal
    :*:ohter::other                 ; other/s/wise
    ::otehrs::others
    ::otehrwise::otherwise
    ::otheriwse::otherwise
    ::otherwies::otherwise
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
    ::participnat::participant
    :*:partiton::partition          ; partition/s/ed/ing
    :*:partiion::partition
    ::pasive::passive
    ::passwrod::password
    ::pasword::password
    ::passowrd::password
    ::passwrods::passwords
    ::paswords::passwords
    ::passowrds::passwords
    :*:paht::path                   ; path/s/lib/way/name
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
    ::performnat::performant
    ::perihperal::peripheral
    ::permanet::permanent
    ::permenant::permanent
    ::permanant::permanent
    :*:perimt::permit               ; permit/s/ted
    ::permited::permitted
    ::permtue::permute
    ::perpendiuclar::perpendicular
    :*:persit::persist              ; persist/s/ed/ent/ing
    ::persistant::persistent
    ::persepctive::perspective
    ::persepctives::perspectives
    ::pertubation::perturbation
    ::pikc::pick
    ::pikcs::picks
    ::pidgeonhole::pigeonhole       ; pigeonhole principle
    ::pixesl::pixels
    ::planend::planned
    ::platfomr::platform
    ::platfomrs::platforms
    ::pleae::please
    ::pleaes::please
    ::pluign::plugin
    ::pluigns::plugins
    ::opint::point
    ::opints::points
    ::poitner::pointer
    ::poitners::pointers
    ::oplicy::policy
    ::oplling::polling
    ::polymorhpic::polymorphic
    ::polynomail::polynomial
    ::polynomails::polynomials
    :C:pop+back::pop_back           ; common C++ container function
    ::postion::position
    ::posible::possible
    ::posisble::possible
    :*:pwoer::power                 ; power/ed, powerpoint, powershell
    :*:opwer::power
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
    :*:preporcess::preprocess       ; preprocess/es/or/ing
    ::preprocesor::preprocessor
    ::prevelant::prevalent
    ::pirmary::primary
    :*:pritn::print                 ; print, printf, println
    ::privte::private
    :*:privelege::privilege         ; privilege/s/d
    :*:priviledge::privilege
    :*:probelm::problem             ; problem/s, problematic
    :*:problme::problem
    :*:prblem::problem
    :*:proceudr::procedur           ; procedure/s, procedural/ly
    :*:proecdur::procedur
    :*:proceess::process            ; process/es/ing/or
    :*:porcess::process
    ::proceses::processes
    ::procesing::processing
    ::procesor::processor
    ::proflie::profile
    ::proflies::profiles
    :*:prgoram::program             ; programming, programmable, programmatic
    ::programable::programmable
    ::programatic::programmatic
    :*:proejct::project             ; project/s/ed/ing/ion
    :*:prjoect::project
    ::promsie::promise
    ::pormise::promise
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
    :*:quikc::quick
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
    ::reconcileable::reconcilable
    ::recrod::record
    ::recrods::records
    ::recurrance::recurrence
    :*:recusi::recursi              ; recursi/ve/on/ng/vely
    :*:recusri::recursi
    :*:recuris::recursi
    :*:reudce::reduce               ; reduce/s/d/r
    ::reduceble::reducible
    ::reudction::reduction
    ::redundnat::redundant
    :*:refator::refactor            ; refactor/s/ed/ing
    :*:refernce::reference          ; reference/s/r/d
    ::referal::referral
    ::refersh::refresh
    ::refershes::refreshes
    :*:registser::register          ; register/s/ed/ing
    ::regresion::regression
    ::regresions::regressions
    ::reuglar::regular
    ::reimaeg::reimage
    ::reinforcment::reinforcement
    :*:rleation::relation           ; relations, relational, relationships
    ::relatinoship::relationship
    ::relationshp::relationship
    ::relationshpi::relationship
    ::relatinoships::relationships
    ::relationshps::relationships
    ::relationshpis::relationships
    ::rleative::relative
    ::releaes::release
    ::releaess::releases
    ::relevnat::relevant
    ::remian::remain
    ::remians::remains
    ::remkae::remake
    ::remnnat::remnant
    :*:rmeove::remove               ; remove/s/d/r
    :*:remvoe::remove
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
    :*:resrve::reserve
    ::reislient::resilient
    ::reoslution::resolution
    ::resoruce::resource
    ::reosurce::resource
    ::resoruces::resources
    ::reosurces::resources
    ::respodn::respond
    ::resopnd::respond
    ::respodns::responds
    ::resopnds::responds
    ::resopnse::response
    ::respones::response
    ::repsonse::response
    ::resposne::response
    ::resopnses::responses
    ::responess::responses
    ::repsonses::responses
    ::resposnes::responses
    :*:reuslt::result               ; result/s/ed/ing
    :*:reslut::result
    :*:rsult::result
    :*:resutl::result
    :*:reulst::result
    :*:resulet::result
    ::reult::result
    ::reults::results
    ::retian::retain
    ::retians::retains
    ::retrive::retrieve
    ::retrives::retrieves
    :*:reutrn::return               ; return/s/ed/ing
    :*:retrn::return
    :*:retrun::return
    :*:retunr::return
    :*:reurtn::return
    ::reurn::return
    ::returnd::returned
    ::returend::returned
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
    ::orund::round
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
    ::scneario::scenario
    ::scnearios::scenarios
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
    ::sersver::server
    ::servver::server
    ::servfer::server
    ::sersvers::servers
    ::servvers::servers
    ::servfers::servers
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
    ::hsould::should
    :*:shirnk::shrink               ; shrink/s/ing
    :*:signla::signal               ; signal/s/ed/er/ing
    ::significnat::significant
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
    ::smalelr::smaller
    ::sockte::socket
    ::socktes::sockets
    ::osftware::software
    ::sovlable::solvable
    :*:sovle::solve                 ; solve/s/d/r/rs
    ::smoe::some
    ::somehing::something
    ::smoething::something
    :*:srot::sort                   ; sort/s/ed/ing/able
    :*:osrt::sort
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
    ::stepepr::stepper
    ::stoarge::storage
    ::streategy::strategy
    ::strenghten::strengthen
    ::sring::string
    ::stirng::string
    ::srings::strings
    ::stirngs::strings
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
    :*:suepr::super                 ; super/script/sede/vised
    ::superscritp::superscript
    ::superscirpt::superscript
    ::superivsed::supervised
    :*:siwthc::switch               ; switch/es/ing/case
    :*:siwtch::switch
    :*:swich::switch
    :*:swtich::switch
    :*:swithc::switch
    :*:synchor::synchro             ; synchronous/ly, synchronized
    ::synchroniation::synchronization
    ::sytnax::syntax
    ::sytnaxes::syntaxes
    :*:sytsem::system               ; system/s/ic/atic
    :*:ssytem::system
    :*:sytem::system

    ::tabel::table
    ::tabels::tables
    ::tkae::take
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
    ::textula::textual
    ::texutal::textual
    ::htan::than
    ::tahn::than
    ::htat::that
    ::taht::that
    ::thta::that
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
    ::tractible::tractable
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
    ::triaegd::triaged
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
    ::unviersal::universal
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

    ::vacnat::vacant
    ::vlaid::valid
    :*:vlaue::value                 ; value/s/d
    :*:avlue::value
    :*:vluae::value
    :*:valeu::value
    ::vareiable::variable
    ::varibale::variable
    ::varible::variable
    ::vareiables::variables
    ::varibales::variables
    ::varibles::variables
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
    ::veritcal::vertical
    ::veritical::vertical
    ::vrey::very
    ::vidoe::video
    ::vidoes::videos
    ::vitual::virtual
    ::virutal::virtual
    ::virtula::virtual
    :*:viist::visit                 ; visit/s, visitor/s
    :*:viusal::visual               ; visual/s/ly/ise/ize/ized/ization
    :*:visula::visual
    :C:VIsual::Visual               ; Visual Studio
    ::visualiation::visualization
    ::visualiations::visualizations
    ::vodi::void                    ; C data type

    ::wkae::wake
    ::watn::want
    ::wnat::want
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
    :*:wokr::work
    ::worht::worth
    ::woudl::would
    ::wouldnt'::wouldn't
    ::wrapepr::wrapper
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
    ; Useful suffix dictionary search tool: https://www.litscape.com/word_tools/ends_with.php)

    :C?:albe::able        ; ex: available, mutable, runnable, readable
    :C?:aegs::ages        ; ex: languages, pages, messages, usages, outages, manages
    :C?:kaes::akes        ; ex: makes, remakes, takes, wakes
    :C?:aenous::aneous    ; ex: simultaneous, extraneous, instantaneous, miscellaneous
    :C?:aetd::ated        ; ex: emulated, obfuscated, encapsulated, updated
    :C?:taion::ation      ; ex: application, optimization, stabilization, mutation, replication
    :C?:taoin::ation
    :C?:taions::ations 
    :C?:taoins::ations
    :C?:autl::ault        ; ex: fault, segfault, default, vault
    :C?:athc::atch        ; ex: catch, batch, match, watch, dispatch
    :C?:atie::ative       ; ex: native, collaborative, alternative, iterative
    :C?:taive::ative
    :C?:bakc::back        ; ex: callback, playback, fallback, rollback
    :C?:bakcs::backs
    :C?:bilties::bilities ; ex: abilities, probabilities, availabilities, possibilities
    :C?:blities::bilities
    :C?:bilites::bilities
    :C?:blites::bilities
    :C?:bilty::bility     ; ex: scalability, ability, mutability, probability
    :C?:blity::bility
    :C?:baord::board      ; ex: keyboard, clipboard, dashboard, motherboard
    :C?:borad::board
    :C?:baords::boards
    :C?:borads::boards
    :C?:btue::bute        ; ex: attribute, contribute, distribute, misattribute
    :C?:ctaing::cating    ; ex: locating, replicating, preallocating, obfuscating
    :C?:caction::cation   ; ex: notification, replication, allocation, application
    :C?:caion::cation
    :C?:cactions::cations
    :C?:caions::cations
    :C?:cetp::cept        ; ex: accept, concept, except, intercept
    :C?:cetps::cepts
    :C?:ctiy::city        ; ex: capacity, opacity, scarcity, atomicity
    :C?:ciyt::city
    :C?:denet::dent       ; ex: independent, descendent, dependent, indent
    :C?:dnet::dent
    :C?:idng::ding        ; ex: offloading, finding, padding, coding
    :C?:donw::down        ; ex: markdown, shutdown, slowdown, teardown
    :C?:odwn::down
    :C?:necy::ency        ; ex: adjacency, consistency, frequency, dependency, latency
    :C?:enyc::ency
    :C?:oeus::eous        ; ex: simultaneous, miscellaneous, advantageous, erroneous
    :C?:ofrm::form        ; ex: platform, perform, transform, inform
    :C?:ofrms::forms
    :C?:garphy::graphy    ; ex: cryptography, photography, demography, typography
    :C?:grahpy::graphy

    :C?:inat::iant        ; ex: variant, invariant, compliant, reliant
    :C?:aite::iate        ; ex: exponentiate, initiate, instantiate, immediate
    :C?:aites::iates
    :C?:icla::ical        ; ex: topological, canonical, symmetrical, logical
    :C?:iicent::icient    ; ex: efficient, deficient, coefficient, inefficient, sufficient
    :C?:ietn::ient        ; ex: gradient, quotient, client, transient
    :C?:ietns::ients
    :C?:igth::ight        ; ex: copyright, height, eight, weight
    :C?:liity::ility      ; ex: probability, stability, feasibility, capability, utility
    :C?:ign::ing          ; ex: running, string, meaning, testing, working, learning, mapping
                          ; Note: see whitelist at the top for valid -ign words
    :C?:nig::ing
    :C?:nigs::ings
    :C?:igns::ings        ; Note: see whitelist at the top for valid -igns words
    :C?:oinal::ional      ; ex: conditional, optional, functional, rational
    :C?:ioanl::ional
    :C?:ouis::ious        ; ex: previous, various, dubious, suspicious
    :C?:oius::ious
    :C?:iison::ision      ; ex: decision, collision, revision, division
    :C?:iisons::isions
    :C?:tiing::iting      ; ex: waiting, writing, editing, limiting, visiting
    :C?:tiive::itive      ; ex: positive, primitive, repetitive, transitive
    :C?:tiives::itives
    :C?:iavte::ivate      ; ex: activate, deactivate, private, derivate
    :C?:ivley::ively      ; ex: relatively, actively, intrusively, recursively
    :C?:iivty::ivity      ; ex: connectivity, sensitivity, productivity, activity
    :C?:iviyt::ivity
    :C?:iezd::ized        ; ex: equalized, synchronized, amortized, randomized
    :C?:kaeg::kage        ; ex: package, leakage, linkage, subpackage
    :C?:alble::lable      ; ex: available, callable, scalable, unscalable
    :C?:ltiy::lity        ; ex: probability, stability, feasibility, capability, utility
    :C?:laod::load        ; ex: overload, download, upload, workload, offload
    :C?:laoded::loaded
    :C?:laoder::loader
    :C?:laods::loads
    :C?:amte::mate        ; ex: approximate, estimate, animate, automate
    :C?:amtes::mates
    :C?:maion::mation     ; ex: information, summation, automation, estimation
    :C?:maions::mations
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

    :C?:ntae::nate        ; ex: concatenate, eliminate, alternate, coordinate
    :C?:naet::nate
    :C?:ntaes::nates
    :C?:naets::nates
    :C?:ntiy::nity        ; ex: infinity, opportunity, sanity, vicinity
    :C?:tnation::ntation  ; ex: representation, orientation, segmentation, indentation
    :C?:tnations::ntations
    :C?:oitn::oint        ; ex: powerpoint, breakpoint, disjoint, watchpoint
    :C?:iont::oint
    :C?:onit::oint
    :C?:oitns::oints
    :C?:ionts::oints
    :C?:onits::oints
    :C?:oudn::ound        ; ex: background, foreground, compound, sound, round
    :C?:oudns::ounds
    :C?:paeg::page        ; ex: page, homepage, webpage, stoppage, subpage
    :C?:opint::point      ; ex: midpoint, breakpoint, checkpoint, logpoint
    :C?:opints::points
    :C?:prot::port        ; ex: import, export, support, transport
    :C?:prots::ports
    :C?:raeg::rage        ; ex: coverage, average, storage, leverage
    :C?:rnat::rant        ; ex: grant, reentrant, quadrant, tolerant
    :C?:rnats::rants
    :C?:raet::rate        ; ex: enumerate, migrate, integrate, generate
    :C?:raets::rates
    :C?:rtiy::rity        ; ex: security, priority, parity, integrity
    :C?:rvoe::rove        ; ex: improve, approve, prove, disprove
    :C?:rvoes::roves
    :C?:sehd::shed        ; ex: distinguished, flushed, pushed, published
    :C?:hsing::shing      ; ex: refreshing, publishing, hashing, smashing, flushing
    :C?:saeg::sage        ; ex: message, usage, misusage, myMessage
    :C?:sihp::ship        ; ex: relationship, ownership, spaceship (operator), membership
    :C?:sihps::ships
    :C?:sino::sion        ; ex: expression, recursion, comprehension, version, permission, dimension
    :C?:soin::sion
    :C?:oisn::sion
    :C?:soins::sions
    :C?:sinos::sions
    :C?:oisns::sions
    :C?:stiy::sity        ; ex: sparsity, necessity, diversity, intensity
    :C?:svie::sive        ; ex: recursive, expressive, permissive, inclusive
    :C?:srot::sort        ; ex: sort, mergesort, quicksort, heapsort
    :C?:sapce::space      ; ex: workspace, backspace, namespace, subspace
    :C?:spcae::space
    :C?:sapces::spaces
    :C?:spcaes::spaces

    :C?:taeg::tage        ; ex: advantage, shortage, outage, stage, percentage
    :C?:tnat::tant        ; ex: constant, important, instant, distant, inhabitant
    :C?:tatn::tant
    :C?:tnats::tants
    :C?:tatns::tants
    :C?:thces::tches      ; ex: catches, batches, switches, matches
    :C?:tenet::tent       ; ex: persistent, content, existent, latent
    :C?:tehr::ther        ; ex: another, either, other, together
    :C?:hting::thing      ; ex: thing, something, anything, nothing
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
    :C?:ttiy::tity        ; ex: entity, identity, quantity, quality
    :C?:tiyt::tity
    :C?:tvie::tive        ; ex: generative, active, relative, effective
    :C?:tuer::ture        ; ex: feature, picture, future, structure
    :C?:tuers::tures
    :C?:utls::ults        ; ex: results, defaults, faults, segfaults
    :C?:tued::uted        ; ex: permuted, contributed, distributed, computed
    :C?:tues::utes        ; ex: executes, attributes, routes, computes
    :C?:tuion::ution      ; ex: execution, resolution, solution, distribution
    :C?:tuions::utions
    :C?:veyr::very        ; ex: every, delivery, discovery, recovery
    :C?:vtiy::vity        ; ex: activity, connectivity, sensitivity, productivity
    :C?:wrae::ware        ; ex: software, hardware, shareware, firmware
    :C?:owrk::work        ; ex: work, network, framework, rework, homework
    :C?:owrks::works
    :C?:wokr::work
    :C?:wokrs::works
#HotIf
