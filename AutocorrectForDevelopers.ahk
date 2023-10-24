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
;       The '?' option still needs an ending character.

; END CHARACTERS
; Add '<' and '>' to supported ending characters (useful for C++ templates).
;    Note: all EndChars characters below except '<' and '>' are default AHK end characters:
#Hotstring EndChars -()[]{}:;'"/\,.?!`n `t<>

; AHK VERSION 1 vs. VERSION 2
; Relevant AutocorrectForDevelopers v1 <=> v2 differences:
; Directives: #HotIf (v2) is #If (v1)
; For literal colons, each colon needs to be escaped in v2
; For example, to encode '::', escape each colon --> `:`:
;     For v1, you only need to escape double colon --> `::

; AUTOCORRECT SCRIPT
; Exclude AHK script from MS Word because it already has an autocorrect (though it doesn't emphasize programming words).
; Note: this conditional can be changed if you would like to include or exclude other applications.
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
    :b0:deign::
    {
    }
    :b0:deraign::
    {
    }
    :?b0:design::
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
    :?b0:foreign::
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
    :b0:outreign::
    {
    }
    :b0:preassign::
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
    :b0:undersign::
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
    :?b0:designs::
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
    :b0:foreigns::
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
    :b0:outreigns::
    {
    }
    :b0:preassigns::
    {
    }
    :b0:reassigns::
    {
    }
    :b0:reconsigns::
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

    ; -otry word suffix whitelist (do not convert these to -tory)
    :b0:otry::
    {
    }
    :b0:bigotry::
    {
    }
    :b0:harlotry::
    {
    }
    :b0:quixotry::
    {
    }
    :b0:zealotry::
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

    ; -tner word suffix whitelist (do not convert these to -nter)
    :b0:tner::
    {
    }
    :b0:kingergartner::
    {
    }
    :?b0:partner::
    {
    }
    :b0:vintner::
    {
    }

    ; -tners word suffix whitelist (do not convert these to -nters)
    :b0:tners::
    {
    }
    :b0:kingergartners::
    {
    }
    :?b0:partners::
    {
    }
    :b0:vintners::
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
    :b0:airty::
    {
        ; do not convert this string to -arity
    }
    :b0:athc::
    {
        ; do not convert this string to -atch
    }
    :b0:athces::
    {
        ; do not convert this string to -atches
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
    :b0:gaes::
    {
        ; do not convert this string to -ages
    }
    :b0:garphy::
    {
        ; do not convert this string to -graphy
    }
    :b0:getn::
    {
        ; do not convert this string to -gent
    }
    :b0:hcing::
    {
        ; do not convert this string to -ching
    }
    :b0:hsing::
    {
        ; do not convert this string to -shing
    }

    :b0:iarty::
    {
        ; do not convert this string to -arity
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
    :b0:ianl::
    {
        ; do not convert this string to -inal
    }
    :b0:ienet::
    {
        ; do not convert this string to -ient
    }
    :b0:ienets::
    {
        ; do not convert this string to -ients
    }
    :b0:inat::
    {
        ; do not convert this string to -iant
    }
    :b0:itfy::
    {
        ; do not convert this string to -tify
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
    :b0:iosu::
    {
        ; do not convert this string to -ious
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
    :b0:itng::
    {
        ; do not convert this string to -ting
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
    :b0:kaes::
    {
        ; do not convert this string to -akes
    }
    :b0:liity::
    {
        ; do not convert this string to -ility
    }
    :b0:liyt::
    {
        ; do not convert this string to -lity
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
    :b0:oinally::
    {
        ; do not convert this string to -ionally
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
    :b0:outn::
    {
        ; do not convert this string to -ount
    }
    :b0:outns::
    {
        ; do not convert this string to -ounts
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

    :b0:taed::
    {
        ; do not convert this string to -ated
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
    :b0:tiion::
    {
        ; do not convert this string to -ition
    }
    :b0:tiioning::
    {
        ; do not convert this string to -itioning
    }
    :b0:tiions::
    {
        ; do not convert this string to -itions
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
    :b0:ullly::
    {
        ; do not convert this string to -ully
    }
    :b0:ulyl::
    {
        ; do not convert this string to -ully
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
    ::accetp::accept
    :*:accomodat::accommodat        ; accommodate/s/d, accommodating
    ::accruacy::accuracy
    ::accruate::accurate
    :*:acknowlege::acknowledge      ; acknowledge/d/s/ment/ments
    :*:acknwoledge::acknowledge
    :*:ackonwledge::acknowledge
    ::activaet::activate
    ::actiavte::activate
    ::actula::actual
    ::acutal::actual
    ::adjacnet::adjacent
    ::adjancecy::adjacency
    :*:ajdust::adjust               ; adjust/s/ed/ing/ment
    ::adminstrator::administrator
    ::administator::administrator
    ::adminstrators::administrators
    ::administators::administrators
    ::advnatage::advantage
    ::advnatages::advantages
    ::agian::again
    ::aehad::ahead
    ::alais::alias
    :*:algoirthm::algorithm         ; algorithm/s/ic
    :*:algorihtm::algorithm
    :*:algoirhtm::algorithm
    :*:algroithm::algorithm
    :*:algortihm::algorithm
    :C:alvie::alive
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
    :*:asert::assert                ; assert/s/ed/ing/ion, assertEqual, assertTrue
    :*:assrt::assert
    :*:asssert::assert
    :*:asserrt::assert
    ::assesment::assessment
    ::assesments::assessments
    ::asisgn::assign
    ::asisgns::assigns
    ::asignment::assignment
    ::asignments::assignments
    ::asigned::assigned
    :*:assocait::associat           ; ex: associat/e/es/ing/ive
    ::assoicative::associative
    ::asycn::async
    ::asynchornous::asynchronous
    ::asynchornously::asynchronously
    ::atmoic::atomic
    :*:atach::attach                ; ex: attach/ed/es/ment
    ::attakc::attack
    ::atribute::attribute
    ::attirbute::attribute
    ::attirubte::attribute
    ::attriubte::attribute
    ::attribtue::attribute
    ::atributes::attributes
    ::attirbutes::attributes
    ::attirubtes::attributes
    ::attriubtes::attributes
    ::attribtues::attributes
    ::auido::audio
    ::aduio::audio
    :*:authetnic::authentic         ; authentic/ate/ity/ator/ating
    :C:auot::auto                   ; C++ keyword
    ::automted::automated
    ::autoamted::automated
    ::avialable::available
    ::aveareg::average
    ::aveage::average
    ::avearge::average
    ::avearegs::averages
    ::aveages::averages
    ::avearges::averages
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
    ::bandiwdth::bandwidth
    ::baselien::baseline
    ::baseilne::baseline
    ::becaues::because
    ::becasue::because
    ::becuase::because
    ::becauase::because
    ::becaseu::because
    ::beofre::before
    ::begni::begin
    ::behaivor::behavior
    ::behvaior::behavior
    ::behaior::behavior
    ::behaivors::behaviors
    ::behvaiors::behaviors
    ::behaiors::behaviors
    ::bheind::behind
    ::bleow::below
    ::benhcmark::benchmark
    ::benhcmarks::benchmarks
    ::betwen::between
    ::beyodn::beyond
    ::bniary::binary
    ::ibnary::binary
    ::binayr::binary
    ::lbock::block
    ::bolean::boolean
    ::boht::both
    ::boundries::boundaries
    ::boundry::boundary
    ::boudnary::boundary
    :*:brnach::branch               ; branch/ed/es, branching, branchless
    :*:brachn::branch
    :*:breka::break                 ; break/s, breakpoint/s, breakthrough
    :*:brkea::break
    :*:braek;::break;               ; break/brake is ambiguous, but the semicolon implies the keyword
    ::breakthrouhg::breakthrough
    :*:braodcast::broadcast         ; broadcast/s/ed/ing/er
    ::borke::broke
    :*:borws::brows                 ; ex: brows/es/ed/er/ers/ing
    :*:brwos::brows
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
    :*:calcualt::calculat           ; calculat/e/ed/es/or/ion
    :*:caluclat::calculat
    ::calucation::calculation
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
    ::certian::certain
    ::chagne::change
    ::chagnes::changes
    ::chagned::changed
    :*:chracter::character          ; character/s/ize/istic
    :*:charcter::character
    :*:charcater::character
    ::characteres::characters
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
    ::chosoe::choose
    ::cihper::cipher
    ::cihpertext::ciphertext
    ::circuti::circuit
    ::circutis::circuits
    ::clagn::clang
    ::clas::class
    ::clss::class
    ::clsses::classes
    ::clasdef::classdef
    ::clasifier::classifier
    ::classifer::classifier
    ::clasifiers::classifiers
    ::classifers::classifiers
    ::caluse::clause
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
    ::clinets::clients
    ::cleints::clients
    ::clcok::clock
    ::lcock::clock
    ::clockc::clock
    ::clcoks::clocks
    ::lcocks::clocks
    ::clockcs::clocks
    ::cloen::clone
    ::cloens::clones
    ::clsoe::close
    ::clsoed::closed
    ::clsoure::closure
    ::clsoures::closures
    ::clodu::cloud
    :*:clutser::cluster             ; cluster/s/ed/ing
    :C:COde::Code                   ; VS Code
    ::colide::collide
    ::colides::collides
    ::colision::collision
    :*:collumn::column              ; column/s/ar/ate/ise
    :*:ocmbin::combin               ; combin/e/ed/es/ation
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
    :*:commite::committe            ; ex: committe/d/r/rs/e/es
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
    :*:comptue::compute             ; compute/r/s/d/rs
    :*:ocmpute::compute
    :*:cmopute::compute
    ::concatneate::concatenate
    ::concatneates::concatenates
    ::concetp::concept
    ::conceptula::conceptual
    ::conceputal::conceptual
    :*:ocndition::condition         ; condition/s/ed/al/ing
    ::confidentality::confidentiality
    :*:ocnfig::config               ; config/ure/urable/uration
    :*:conenct::connect             ; connect/s/ed/ion/ing/ions/or
    :*:conect::connect
    ::conseuctive::consecutive
    ::consectuive::consecutive
    ::concensus::consensus
    :*:consdier::consider           ; consider/s/ed/ably/ation
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
    ::constexrp::constexpr          ; C++ keyword
    ::constratin::constraint
    ::constraitn::constraint
    ::constriant::constraint
    ::constratins::constraints
    ::constraitns::constraints
    ::constriants::constraints
    ::constuctor::constructor
    ::consutl::consult
    ::consuem::consume
    ::consuems::consumes
    ::consuemr::consumer
    ::consuemrs::consumers
    :*:contian::contain             ; contains, container
    ::contaienr::container
    ::contaienrs::containers
    :*:contineu::continue           ; continue/d/s
    :*:ocntinue::continue
    :*:contniue::continue
    ::conitnuous::continuous
    ::contniuous::continuous
    ::conitnuously::continuously
    ::contniuously::continuously
    :*:contirbut::contribut         ; contribute/d, contributor
    ::contribtue::contribute
    :*:contorl::control             ; control/s/led/ler/ling
    :*:ocntrol::control
    ::convet::convert
    ::convets::converts
    ::convertes::converts
    ::cookei::cookie
    ::cookeis::cookies
    ::coordiante::coordinate
    ::coordiantes::coordinates
    ::copeis::copies
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
    ::crasehs::crashes
    ::cralwer::crawler              ; web crawler
    ::creat::create                 ; note: there exists a legacy C syscall called 'creat'
    ::creaete::create
    ::creats::creates
    ::creaet::create
    ::creaetes::creates
    ::criteira::criteria
    ::crtieria::criteria
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
    ::custoemr::customer
    ::custoemrs::customers
    ::customie::customize
    ::customies::customizes

    ::damaeg::damage
    ::dahsboard::dashboard
    :*:dadta::data                  ; data/set/sets/base
    ::dtaa::data
    :*:datda::data
    ::databse::database
    ::databaes::database
    ::datbase::database
    ::databses::databases
    ::datbases::databases
    ::dataest::dataset
    ::dataests::datasets
    ::deactivaet::deactivate
    ::deactiavte::deactivate
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
    :*:defalut::default
    :*:dfeault::default
    :*:defauilt::default
    :*:defautl::default
    :*:defien::define               ; define/s/d
    :*:dleete::delete               ; delete/s/d/r
    ::deletd::deleted
    ::dleetion::deletion
    ::dleivery::delivery
    :*:dmeonstrat::demonstrat       ; demonstrat/e/s/ing/ion/ive
    :*:dpeend::depend               ; depends, dependency, dependence, dependencies
    :*:depenenc::dependenc
    :*:depht::depth                 ; depth, depthFirstSearch
    :*:detph::depth
    :*:derefernce::dereference      ; dereference/s/d
    ::deriavte::derivate
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
    ::determinstic::deterministic
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
    ::dfiference::difference
    ::diferences::differences
    ::dfiferences::differences
    ::diferent::different
    :*:differnet::different         ; different/ial/iable/iate
    :*:dfiferent::different
    :*:dififcult::difficult         ; difficult, difficulty, difficulties
    :*:difficutl::difficult
    :*:diffiuclt::difficult
    ::difficulyt::difficulty
    ::difficluty::difficulty
    ::digets::digest
    ::dimensinoal::dimensional
    ::dimensinoality::dimensionality
    :*:driect::direct               ; direct/s/ed/ly/ive/ion/ory
    ::directd::directed
    ::diretory::directory
    ::directoroy::directory
    ::diretories::directories
    ::diable::disable
    ::diables::disables
    ::disadvnatage::disadvantage
    ::disadvnatages::disadvantages
    :*:disconenct::disconnect       ; disconnect/ed/ion/ing/ions/or
    :*:disconect::disconnect
    :*:disocver::discover           ; discover/s/y/ed/ing
    ::dispaly::display
    ::idsplay::display
    ::dispalys::displays
    ::idsplays::displays
    :*:distni::distin               ; distinct/ion, distinguish/ing/ability
    ::distribtue::distribute
    ::distriuted::distributed
    ::distirbuted::distributed
    ::distribtued::distributed
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
    ::donwstream::downstream
    ::drvie::drive
    ::dupm::dump
    ::dupms::dumps
    :*:duplcat::duplicat            ; duplicat/e/es/ing/ion

    ::eahc::each
    ::easeir::easier
    ::edidt::edit
    ::edidts::edits
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
    :*:eleemnt::element
    :*:leement::element
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
    ::egnine::engine
    ::enginer::engineer
    ::egnineer::engineer
    ::enginers::engineers
    ::egnineers::engineers
    :*:enahnce::enhance             ; enhance/d/s/ment/ments
    ::enhancment::enhancement
    ::enhancments::enhancements
    ::enoguh::enough
    ::ensrue::ensure
    ::ensrues::ensures
    :*:ential::entail               ; ential/s/ed/ing/ment
    ::enttiy::entity
    ::entiyt::entity
    ::enitty::entity
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
    :*:euqal::equal                 ; equal/s/ed/ly/ing/ity
    ::euation::equation
    ::eqeuation::equation
    ::equateion::equation
    ::euations::equations
    ::eqeuations::equations
    ::equateions::equations
    ::equivalenet::equivalent
    ::equivlent::equivalent
    ::equivlaent::equivalent
    ::eraes::erase
    ::errror::error
    ::errrors::errors
    :*:esitmat::estimat             ; estimat/e/ed/es/ing/ion
    ::estimiation::estimation
    :*:evlauat::evaluat             ; evaluate/d/s, evaluati/ng/on
    ::evenet::event
    ::evenets::events
    ::eventes::events
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
    ::exampel::example
    ::eamples::examples
    ::examles::examples
    ::exaples::examples
    ::exmaples::examples
    ::exampels::examples
    :*:excpet::except               ; except/s/ed/ion/ions
    :*:excetp::except
    ::excahnge::exchange
    ::excahnges::exchanges
    :*:exeuct::execut               ; execut/e/ing/ion/able
    ::exectable::executable
    ::exectables::executables
    ::exectue::execute
    ::existance::existence
    ::exectuer::executer            ; exception for '-tuer' -> '-ture'
    ::exectuers::executers
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
    ::exprssion::expression
    ::expresisons::expressions
    ::expresions::expressions
    ::exprssions::expressions
    ::extedn::extend
    ::exetnd::extend
    ::extedns::extends
    ::exetnds::extends
    ::extnesion::extension
    ::externla::external

    ::fkae::fake
    ::fautl::fault
    ::favoriet::favorite
    ::favoriets::favorites
    ::failrue::failure
    ::fialure::failure
    ::failrues::failures
    ::fialures::failures
    ::fallthrouhg::fallthrough
    ::flase::false
    ::aflse::false
    :C:fales::false                 ; case-sensitive to preserve 'Fales' surname
    ::fasle::false
    :*:feasab::feasib               ; feasible, feasibly, feasibility
    ::fethc::fetch
    ::fibonnaci::fibonacci          ; fibonacci sequence, fibonacci heap
    ::fiedl::field
    ::fiedls::fields
    ::fiel::file
    ::fiels::files
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
    ::flwo::flow
    ::fodler::folder
    ::fodlers::folders
    ::fodling::folding
    :*:folow::follow                ; follow/s/ed/er/ing
    :C:fro::for                     ; 'for' keyword
    :C:ofr::for
    :C:FOr::For
    :C:foreeach::foreach            ; Perl keyword
    ::foregorund::foreground
    ::foregournd::foreground
    ::foriegn::foreign
    ::froeign::foreign              ; exception for '-ign' to '-ing'
    ::foreing::foreign
    ::froms::forms
    :C:forSOme::forSome             ; Scala keyword
    ::forwared::forward
    ::fo rthe::for the
    ::fort he::for the
    ::fo rteh::for the
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
    :*:fucniton::function
    :*:fucntino::function
    :*:fucntoin::function
    :*:fucniotn::function
    :*:funtcion::function
    :*:fuction::function
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
    ::goe sto::goes to
    ::goign::going
    ::oging::going
    ::goot::goto
    ::gradiet::gradient
    :C:grammer::grammar             ; case sensitive to preserve 'Grammer' surname
    :*:grpah::graph                 ; graphs, graphing, graphics
    :*:grahp::graph
    :*:garph::graph
    ::gredy::greedy
    ::gerat::great
    ::gorund::ground
    ::gournd::ground
    :*:gorup::group                 ; group/s/ed/ing
    :*:gropu::group

    :C:hsa::has
    :C:Hsa::Has
    :*:hahs::hash                   ; hash/es/ed/ing/table
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
    ::hierarhcy::hierarchy
    ::hihg::high
    ::hihger::higher
    ::hightest::highest
    ::hodler::holder
    ::hodlers::holders
    ::hoem::home
    :C:horus::hours
    ::howver::however
    ::howthe::how the
    ::howto::how to
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

    ::identtiy::identity
    ::identiyt::identity
    ::idenitty::identity
    :*:igonr::ignor                 ; ignor/e/es/ed/ing
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
    ::implciit::implicit
    :*:imoprt::import               ; import/s/ed/er
    ::impot::import
    ::impots::imports
    ::imporant::important
    ::imposible::impossible
    ::imposisble::impossible
    :*:incldue::include             ; include/s/d
    :*:incdlue::include
    :*:inculde::include
    ::includ::include
    ::inclue::include
    ::inclues::includes
    ::inclsive::inclusive
    :*:icnrement::increment         ; increment/s/al/ed/ing
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
    :*:indeex::index
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
    :*:isnert::insert               ; insert/s/ed/er/ion
    :*:insret::insert
    :*:inserrt::insert
    :*:isnta::insta                 ; instance, install, instantiate
    ::intall::install
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
    ::integirty::integrity
    :*:intelig::intellig            ; intellig/ent/ence/ible
    :*:itner::inter                 ; interface, internal, interact, interval
    ::intercetp::intercept
    ::interafce::interface
    :*:interopl::interpol           ; interpol/ate/ated/ates/ating
    :*:intepr::interp               ; interpolat/e/ion, interpret/s/ation
    ::internla::internal
    ::internlas::internals
    :*:interperet::interpret        ; interpret/s/ed/er
    ::interpeter::interpreter
    :*:interupt::interrupt          ; interrupt/s/ed/er/ing/ion
    :C:inot::into
    ::intractible::intractable
    ::inthe::in the
    ::in th::in the
    ::invariatn::invariant
    ::ivnariant::invariant
    ::invariatns::invariants
    ::ivnariants::invariants
    ::invertable::invertible
    ::i nrange::in range            ; Python loop
    ::iosream::iostream             ; standard C++ I/O header
    ::iosteam::iostream
    ::isotream::iostream
    ::isintance::isinstance         ; Python function
    ::ins't::isn't
    ::isseu:::issue
    ::isseus::issues
    ::isthe::is the
    ::is ot::is to
    ::iteation::iteration
    ::itereation::iteration
    ::iteations::iterations
    ::itereations::iterations
    ::itereator::iterator
    ::iteator::iterator
    ::itereators::iterators
    ::iteators::iterators
    ::istelf::itself
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
    ::jion::join
    ::jions::joins
    ::jorunal::journal
    ::jsut::just

    ::keywrod::keyword
    ::keywrods::keywords
    :*:knwo::know                   ; ex: know/s/n/ing/ledge
    :*:konw::know
    :*:nkow::know
    ::knowlege::knowledge

    ::lable::label
    ::lables::labels
    ::labmda::lambda
    ::lamda::lambda
    ::lambad::lambda
    ::langauge::language
    ::langague::language
    ::lnaguage::language
    ::lagnuage::language
    ::lnagauge::language
    ::languaeg::language
    ::lanaguage::language
    ::langauges::languages
    ::langagues::languages
    ::lnaguages::languages
    ::lagnuages::languages
    ::lnagauges::languages
    ::lanaguages::languages
    ::largets::largest
    :*:lauchn::launch               ; launch/es/ed/ing
    ::leadre::leader
    ::laeder::leader
    ::leran::learn
    ::leraning::learning
    ::lerans::learns
    ::lesat::least
    :C:elft::left                   ; binary tree left/right
    ::legnth::length
    ::lenght::length
    ::lnegth::length
    ::leter::letter
    ::lettter::letter
    ::leters::letters
    ::lettters::letters
    ::levle::level
    ::levles::levels
    ::liaiason::liaison
    ::laison::liaison
    ::laiason::liaison
    ::librarry::library
    ::liek::like
    ::lieks::likes
    :*:liimt::limit                 ; limit/s/ed/er/ing/ation
    ::limittation::limitation
    ::limittations::limitations
    :C:ilne::line
    ::lienar::linear
    ::linera::linear
    ::lienarly::linearly
    ::lineraly::linearly
    ::ilnes::lines
    ::linkaeg::linkage
    :C:LInux::Linux
    ::lniux::linux
    ::lsit::list
    ::lsited::listed
    :*:lsiten::listen               ; listen/s/er/ers/ing
    ::listenr::listener
    ::listenrs::listeners
    ::lsits::lists
    ::lvie::live
    ::logairthm::logarithm
    ::lgoical::logical
    ::loign::login
    ::lookaisde::lookaside          ; translation lookaside buffer (TLB)
    :*:looop::loop                  ; loop/s/ed/ing
    ::logner::longer
    ::longets::longest
    ::lognest::longest
    ::lwoer::lower
    ::lwoercase::lowercase

    ::mahcine::machine
    ::machien::machine
    ::macine::machine
    ::machins::machines
    ::mahcines::machines
    ::machiens::machines
    ::macines::machines
    ::machine leaning::machine learning
    ::macintohs::macintosh
    ::maintian::maintain
    ::maintians::maintains
    ::mkae::make
    ::maek::make
    ::amke::make
    ::maloc::malloc
    :*:manaeg::manage               ; manage/r/d/rs/ment/eable
    :*:manfactur::manufactur        ; manufactur/ed/er/ing
    ::mnay::many
    ::marign::margin
    ::mathamatics::mathematics
    ::mathmatics::mathematics
    ::mathamatical::mathematical
    ::mathmatical::mathematical
    ::maltab::matlab
    ::mtalab::matlab
    ::amtrix::matrix
    ::maxinum::maximum
    ::menas::means
    ::menat::meant
    ::memoiation::memoization
    :*:memroiz::memoriz             ; memoriz/e/ed/ation
    :*:memrois::memoris
    ::memroy::memory
    ::mrege::merge
    ::emrge::merge
    ::mreges::merges
    ::mreged::merged
    ::mesage::message
    ::messgae::message
    ::mesages::messages
    ::messageing::messaging
    ::emtadata::metadata
    ::metadadta::metadata
    ::metadat::metadata
    ::microsfot::microsoft
    ::mininum::minimum
    ::mispell::misspell
    ::mdoe::mode
    ::modle::model
    ::mdoel::model
    ::modles::models
    ::mdoels::models
    ::moduel::module
    ::moduels::modules
    ::mroe::more
    ::omre::more
    ::msot::most
    ::mosue::mouse
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
    :*:entwork::network             ; network/s/ed/ing
    ::nerual::neural
    ::enxt::next
    :C:onde::node
    :C:ndoe::node
    ::ondes::nodes
    ::ndoes::nodes
    ::normlaize::normalize
    ::normlaizes::normalizes
    :*:northwset::northwest
    :C:Nto::Not
    :C:nto::not
    :*:ntoe::note                   ; ex: note/s/d/pad
    ::notifcation::notification
    ::nulll::null
    ::nulopt::nullopt               ; C++
    ::nulllopt::nullopt
    ::nulptr::nullptr
    ::nulllptr::nullptr
    ::nubmer::number
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
    ::offical::official
    ::ofthe::of the
    ::ofteh::of the
    ::ofhte::of the
    ::fo the::of the
    ::oft he::of the
    ::ofthis::of this
    ::onthe::on the
    ::oens::ones
    ::onlly::only
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
    ::otuer::outer                  ; exception for '-tuer' -> '-ture'
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
    :*:packaeg::package
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
    :*:apramter::parameter
    ::parameteres::parameters
    ::praent::parent
    ::parenet::parent
    ::aprent::parent
    :*:pasre::parse                 ; parse/d/s/r
    ::parital::partial
    ::participnat::participant
    :*:paritc::partic               ; partic/ipant/ipate/ular
    :*:partiton::partition          ; partition/s/ed/ing
    :*:parittion::partition
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
    :*:peform::perform
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
    ::placehodler::placeholder
    ::placehodlers::placeholders
    ::planend::planned
    ::platfomr::platform
    ::platfomrs::platforms
    ::pleae::please
    ::pleaes::please
    ::pluign::plugin
    ::pluigns::plugins
    ::opint::point
    ::opints::points
    ::pionter::pointer
    ::pionters::pointers
    ::oplicy::policy
    ::oplling::polling
    ::polymorhpic::polymorphic
    ::polynomail::polynomial
    ::polynomails::polynomials
    :C:pop+back::pop_back           ; common C++ container function
    ::postion::position
    ::opsition::position
    ::postions::positions
    ::opsitions::positions
    ::posible::possible
    ::posisble::possible
    :*:pwoer::power                 ; power/ed, powerpoint, powershell
    :*:opwer::power
    ::ppritn::pprint                ; Python pretty printer
    :*:pratice::practice            ; practice/s/d
    ::prgama::pragma                ; #pragma
    ::prealocate::preallocate
    ::prealocates::preallocates
    :*:preocmput::precomput         ; precomput/e/es/ed/ing
    ::predecssor::predecessor
    ::predecesor::predecessor
    ::rpedicate::predicate          ; a function returing true/false
    ::preidcate::predicate
    :*:preidct::predict
    ::prefered::preferred
    ::prefecth::prefetch
    ::rpefix::prefix
    ::preifx::prefix
    :*:prpear::prepar               ; prepar/e/es/ed/ation
    :*:preporcess::preprocess       ; preprocess/es/or/ing
    ::preprocesor::preprocessor
    :*:prserve::preserve            ; preserve/s/d/r
    ::prevelant::prevalent
    :*:prevetn::prevent             ; prevent/s/ed/ion/able
    ::pirmary::primary
    ::priamry::primary
    :*:pritn::print                 ; print, printf, println
    ::privte::private
    ::priavte::private
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
    :*:proudct::product             ; product/s/ion/ivity
    ::proudcer::producer
    ::proudcers::producers
    ::prdoucer::producer
    ::prdoucers::producers
    ::proflie::profile
    ::proflies::profiles
    :*:prgoram::program             ; programming, programmable, programmatic
    :*:porgram::program
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
    :*:publihs::publish             ; publish/ed/er/es/ing
    ::puhs::push
    :C:push+back::push_back         ; common C++ container function
    ::pythno::python
    ::pyton::python
    ::pythohn::python
    :C:PYthon::Python
    ::pyhton::python

    ::qualyit::quality
    ::quanitty::quantity
    ::quanttiy::quantity
    ::quantiyt::quantity
    ::qeuries::queries
    ::qeuried::queried
    ::queyr::query
    ::qeury::query
    ::queyring::querying
    ::qeurying::querying
    :*:qustion::question            ; question/s/ed/ing/able
    :*:quetion::question
    :*:quetsion::question
    ::queu::queue
    ::qeuue::queue
    ::qeueu::queue
    ::queus::queues
    ::qeuues::queues
    ::qeueus::queues
    :*:qiuck::quick                 ; quickly, quicksort, quickselect
    :*:quikc::quick
    ::quicksleect::quickselect

    ::riase::raise
    ::riases::raises
    :*:ranodm::random               ; random/ly/ise/ize/ization
    :*:rnadom::random
    ::rnage::range
    ::rnages::ranges
    ::rtaio::ratio
    ::raedy::ready
    ::rela::real
    ::relaly::really
    ::rebulid::rebuild
    ::rebiuld::rebuild
    ::rebulids::rebuilds
    ::rebiulds::rebuilds
    :*:reciev::receiv               ; receiv/able/e/ed/er/ing
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
    ::reltaionship::relationship
    ::relatinoships::relationships
    ::relationshps::relationships
    ::relationshpis::relationships
    ::reltaionships::relationships
    ::rleative::relative
    ::releaes::release
    ::releaess::releases
    ::relevnat::relevant
    :*:remian::remain               ; ex: remain/s/ed/der/ing
    :*:remina::remain
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
    :*:replcia::replica             ; replica/s/te/tion
    ::repamt::repmat                ; common MATLAB function
    :*:reoprt::report               ; report/s/ed/er/ing
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
    :*:represnet::represent         ; represent/s/ed/ing/ation
    :*:reprsent::represent
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
    :*:rquire::require
    :*:rqeuire::require
    ::requirment::requirement
    ::requirments::requirements
    ::requirse::requires
    ::resaerch::research
    ::reserach::research
    ::resarch::research
    :*:rserve::reserve              ; reserve/s/d
    :*:resrve::reserve
    ::reisde::reside
    ::reisdes::resides
    ::reislient::resilient
    ::reoslution::resolution
    ::reoslutions::resolutions
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
    :*:restirct::restrict           ; restrict/s/ed/ion/ing
    :*:reuslt::result               ; result/s/ed/ing
    :*:reslut::result
    :*:rsult::result
    :*:resutl::result
    :*:reulst::result
    :*:resulet::result
    :*:rueslt::result
    ::reult::result
    :*:reuslet::result
    :*:rslut::result
    :*:resluet::result
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
    :*:reutnr::return
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
    ::rolback::rollback
    ::orund::round
    ::rotue::route
    ::rotuer::router                ; exception for -tuer  -> -ture
    ::rotuers::routers              ; exception for -tuers -> -tures
    ::runenr::runner
    ::runing::running

    :*:saef::safe                   ; safety, safer, safest
    ::sfae::safe
    ::saem::same
    ::smae::same
    ::svae::save
    ::svaes::saves
    ::svaing::saving
    ::scaleable::scalable
    ::scneario::scenario
    ::scnearios::scenarios
    :*:scheudl::schedul             ; schedule/s/d/r, scheduling
    :*:schedlu::schedul
    ::shcema::schema
    ::schmea::schema
    ::scientiifc::scientific
    :*:scritp::script               ; script/s/ed/ing
    :*:sript::script
    :*:sritp::script
    :*:scirpt::script
    :*:serach::search               ; search/ed/es/ing
    :*:saerch::search
    ::escond::second
    ::seocnd::second
    ::esconds::seconds
    ::seocnds::seconds
    ::seconsd::seconds
    ::secuirty::security
    ::segfautl::segfault
    :*:sleect::select               ; select/s/ion/ions
    :*:seelct::select
    ::selet::select
    ::selectes::selects
    ::select * form::select * from  ; common sql selection
    ::select 8 from::select * from
    ::slef::self                    ; Python current class instance
    ::sedner::sender
    ::sedners::senders
    :C:SendINput::SendInput         ; common AutoHotkey function
    ::senstivity::sensitivity
    :*:seperat::separat             ; separate, separation, separator
    ::seprate::separate
    ::seuqen::sequen                ; sequen/ce/cing/tial
    ::sersver::server
    ::servver::server
    ::servfer::server
    ::serfver::server
    ::sersvers::servers
    ::servvers::servers
    ::servfers::servers
    ::serfvers::servers
    ::serivce::service
    ::esrvice::service
    ::serivces::services
    ::esrvices::services
    ::setapram::setparam            ; Kotlin soft keyword
    :C:setTimeotu::setTimeout       ; JavaScript function
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
    ::ismilar::similar
    ::similarty::similarity
    ::simulatenous::simultaneous
    ::signle::single
    ::singel::single
    ::singluar::singular
    ::siez::size
    :C:isze::size
    :C:sie_t::size_t                ; common C++ data type
    :C:sizet::size_t
    :C:size_T::size_t
    :C:size-t::size_t
    ::sieof::sizeof
    ::sie of::size of
    ::slwo::slow
    ::slwoer::slower
    ::slwoest::slowest
    ::smalelr::smaller
    ::sockte::socket
    ::socktes::sockets
    ::osftware::software
    ::sovlable::solvable
    :*:sovle::solve                 ; solve/s/d/r/rs
    ::smoe::some
    ::osme::some
    ::somehing::something
    ::smoething::something
    ::osmething::something
    ::osmetime::sometime
    ::osmetimes::sometimes
    :*:srot::sort                   ; sort/s/ed/ing/able
    :*:osrt::sort
    ::soretd::sorted
    ::soruce::source
    ::soruces::sources
    ::sproadic::sporadic
    ::sproadically::sporadically
    ::spritnf::sprintf              ; common string formatting function
    ::sqltie::sqlite
    ::slqite::sqlite
    ::sqltie3::sqlite3
    ::slqite3::sqlite3
    ::stabel::stable
    ::stakc::stack
    ::satck::stack
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
    ::stepepd::stepped
    ::stepepr::stepper
    ::stoarge::storage
    ::stoage::storage
    ::stroe::store
    ::stroed::stored
    ::streategy::strategy
    ::strenghten::strengthen
    :*:sring::string                ; ex: string/s/ent/ify
    :*:stirng::string
    :*:tsring::string
    ::storng::strong
    ::stornger::stronger
    ::stuct::struct
    ::strcut::struct
    :*:strutur::structur            ; structur/e/ed/al/es
    :*:structcur::structur
    :*:strucutr::structur
    ::structrued::structured
    ::styel::style
    ::sytle::style
    ::styels::styles
    ::sytles::styles
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
    :*:subcribe::subscribe          ; subscribe/d/r/s
    ::subscritp::subscript          ; Swift keyword
    ::subscirpt::subscript
    ::subseuqent::subsequent
    ::subseuqently::subsequently
    ::substitue::substitute
    ::substittue::substitute
    ::substtitue::substitute
    ::subsring::substring
    ::substirng::substring
    ::subract::subtract
    :*:sucess::success              ; success/ful/fully/or/ive
    ::succes::success
    ::succesor::successor
    ::successfuly::successfully
    ::succesfully::successfully
    ::suggets::suggest
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
    ::tempalet::template
    ::tempaltes::templates
    ::temmplates::templates
    ::templaes::templates
    ::temlates::templates
    ::tempalets::templates
    ::tempoarl::temporal
    ::tempoarry::temporary
    ::temoprary::temporary
    ::tendancy::tendency
    ::temrinal::terminal
    ::termiante::terminate
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
    ::hteir::their
    ::theri::their
    ::htem::them
    ::theem::theme
    ::hteme::theme
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
    ::thsoe::those
    :*:thoguht::thought             ; thought/s/ful/fully
    ::thershold::threshold
    ::throuhg::through
    ::thorw::throw
    ::thorws::throws
    ::tiel::tile
    ::tiels::tiles
    ::tiem::time
    ::timeotu::timeout
    ::tiems::times
    ::todya::today
    ::tdoay::today
    ::tood`:::todo`:                ; 'tood:' -> 'todo:'
    ::togehter::together
    :*:toekn::token                 ; token/s/ise/izer/isation
    ::tolerence::tolerance
    ::tolernace::tolerance
    ::toelrance::tolerance
    ::tolerences::tolerances
    ::tolernaces::tolerances
    ::toelrances::tolerances
    ::toolsrip::toolstrip
    ::toplogical::topological
    ::ot be::to be
    ::t obe::to be
    ::ot do::to do
    ::ot the::to the
    ::tothe::to the
    ::t othe::to the
    ::tractible::tractable
    ::trian::train
    ::trianed::trained
    ::trianing::training
    ::trians::trains
    :*:trnas::trans                 ; transmit, transaction, transfer, transport, translation
    ::transcation::transaction
    ::transfomer::transformer
    ::transiitive::transitive
    ::transiitively::transitively
    ::travling::traveling
    ::traeling::traveling
    ::traersal::traversal
    ::traversla::traversal
    ::traersals::traversals
    ::traverslas::traversals
    ::treee::tree
    ::treees::trees
    ::triaeg::triage
    ::triaegd::triaged
    ::ture::true
    :*:trucate::truncate            ; truncate/s/d
    ::tuend::tuned
    ::tupel::tuple
    ::tyep::type
    ::tyeps::types
    ::tyepalias::typealias          ; Swift keyword
    ::tyepdef::typedef
    ::typenaem::typename
    ::tyepof::typeof

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
    :*:unsubcribe::unsubscribe      ; unsubscribe/d/s
    ::unitl::until
    ::utnil::until
    :*:udpate::update               ; update/s/d/r
    :*:upadte::update
    :*:updadte::update
    ::upsream::upstream
    ::uesr::user
    ::uesrs::users

    ::vacnat::vacant
    ::vlaid::valid
    :*:vlaue::value                 ; value/s/d
    :*:avlue::value
    :*:vluae::value
    :*:valeu::value
    ::vlue::value
    ::vlues::values
    ::vareiable::variable
    ::varibale::variable
    ::varible::variable
    ::varaible::variable
    ::vareiables::variables
    ::varibales::variables
    ::varibles::variables
    ::varaibles::variables
    ::varaidic::variadic
    ::variatn::variant
    ::variatns::variants
    ::vetor::vector
    ::vecotr::vector
    ::vetcor::vector
    ::vecctor::vector
    ::veirfy::verify
    ::vierfy::verify
    ::verifiy::verify
    ::veriyf::verify
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
    ::viod::void

    ::wkae::wake
    ::wiating::waiting
    ::watn::want
    ::wnat::want
    ::wanring::warning
    :C:wsa::was
    ::wa snot::was not
    ::wans't::wasn't
    ::wan't::wasn't
    ::wasnt'::wasn't
    :*:wtach::watch                 ; watch/ed/es/dog/point
    :*:wieght::weight               ; weight/s/ed/ing
    ::wern't::weren't
    ::whta::what
    ::hwat::what
    ::waht::what
    ::hwen::when
    ::wehn::when
    ::whne::when
    ::whent he::when the
    ::whe nthe::when the
    ::whenver::whenever
    ::wehnever::whenever
    ::hwenever::whenever
    ::hwere::where
    ::wehre::where
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
    ::whlei::while
    :*:whtie::white                 ; whiteboard, whitelist, whitespace
    ::whitelsit::whitelist
    ::whitelsited::whitelisted
    ::whitelsits::whitelists
    ::whoel::whole
    ::iwdth::width
    :*:winowd::window               ; window/s/ed/ing
    :*:winodw::window
    ::iwth::with
    ::wiht::with
    ::wtih::with
    ::witht he::with the
    ::wihtin::within
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
    ::workflwo::workflow
    ::worht::worth
    ::woudl::would
    ::wouldnt'::wouldn't
    ::wrapepr::wrapper
    :*:wirte::write                 ; writer, writable, Write-Output
    :*:wriet::write
    :*:wrtie::write
    ::wirtten::written

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

    :C?:albe::able        ; ex: available, mutable, scalable, readable, variable
    :C?:aegs::ages        ; ex: languages, pages, messages, usages, outages, manages, averages
    :C?:gaes::ages
    :C?:kaes::akes        ; ex: makes, remakes, takes, wakes, stakes
    :C?:allly::ally       ; ex: automatically, finally, optionally, sporadically, computationally
    :C?:alyl::ally
    :C?:aenous::aneous    ; ex: simultaneous, extraneous, instantaneous, miscellaneous, spontaneous
    :C?:airty::arity      ; ex: parity, modularity, similarity, linearity, popularity
    :C?:iarty::arity
    :C?:aetd::ated        ; ex: emulated, obfuscated, encapsulated, updated, automated, related
    :C?:taed::ated
    :C?:taion::ation      ; ex: application, optimization, relation, mutation, replication
    :C?:taoin::ation
    :C?:taions::ations
    :C?:taoins::ations
    :C?:athc::atch        ; ex: catch, batch, match, watch, dispatch
    :C?:atie::ative       ; ex: native, collaborative, alternative, iterative, generative
    :C?:taive::ative
    :C?:bakc::back        ; ex: callback, playback, fallback, rollback, feedback
    :C?:bakcs::backs
    :C?:bilties::bilities ; ex: abilities, probabilities, availabilities, possibilities, capabilities
    :C?:blities::bilities
    :C?:bilites::bilities
    :C?:blites::bilities
    :C?:bilty::bility     ; ex: scalability, ability, mutability, probability, stability
    :C?:blity::bility
    :C?:baord::board      ; ex: keyboard, clipboard, dashboard, motherboard, soundboard
    :C?:borad::board
    :C?:baords::boards
    :C?:borads::boards
    :C?:ctaing::cating    ; ex: locating, replicating, preallocating, obfuscating, communicating
    :C?:caction::cation   ; ex: notification, replication, allocation, application, communication
    :C?:caion::cation
    :C?:cactions::cations
    :C?:caions::cations
    :C?:hcing::ching      ; ex: caching, matching, touching, watching, launching
    :C?:ctiy::city        ; ex: capacity, opacity, scarcity, atomicity, multiplicity
    :C?:ciyt::city
    :C?:daet::date        ; ex: update, validate, invalidate, mandate, candidate
    :C?:daets::dates
    :C?:denet::dent       ; ex: independent, descendent, dependent, indent, descendent
    :C?:dnet::dent
    :C?:idng::ding        ; ex: offloading, finding, padding, coding, encoding, building
    :C?:donw::down        ; ex: down, markdown, shutdown, slowdown, teardown
    :C?:odwn::down
    :C?:necy::ency        ; ex: adjacency, consistency, frequency, dependency, latency
    :C?:enyc::ency
    :C?:oeus::eous        ; ex: simultaneous, miscellaneous, advantageous, erroneous, homogeneous
    :C?:ofrm::form        ; ex: platform, perform, transform, inform, uniform
    :C?:ofrms::forms
    :C?:getn::gent        ; ex: agent, intelligent, tangent, convergent, urgent
    :C?:garphy::graphy    ; ex: cryptography, photography, demography, typography, steganography
    :C?:grahpy::graphy

    :C?:inat::iant        ; ex: variant, invariant, compliant, reliant, covariant
    :C?:aite::iate        ; ex: exponentiate, initiate, instantiate, immediate, associate
    :C?:aites::iates
    :C?:icla::ical        ; ex: topological, canonical, symmetrical, logical, lexical
    :C?:iicent::icient    ; ex: efficient, deficient, coefficient, inefficient, sufficient
    :C?:ietn::ient        ; ex: gradient, quotient, client, transient, recipient
    :C?:ienet::ient
    :C?:ietns::ients
    :C?:ienets::ients
    :C?:igth::ight        ; ex: copyright, height, light, weight, right
    :C?:liity::ility      ; ex: probability, stability, feasibility, capability, utility
    :C?:ianl::inal        ; ex: terminal, final, original, ordinal, marginal
    :C?:ign::ing          ; ex: running, string, meaning, testing, working, learning, mapping
                          ; Note: see whitelist at the top for valid -ign words
    :C?:nig::ing
    :C?:nigs::ings
    :C?:igns::ings        ; Note: see whitelist at the top for valid -igns words
    :C?:oinal::ional      ; ex: conditional, optional, functional, rational, relational
    :C?:ioanl::ional
    :C?:oinally::ionally
    :C?:ouis::ious        ; ex: previous, various, dubious, suspicious, cautious
    :C?:oius::ious
    :C?:iosu::ious
    :C?:iison::ision      ; ex: decision, collision, revision, division, elision
    :C?:iisons::isions
    :C?:tiing::iting      ; ex: waiting, writing, editing, limiting, visiting
    :C?:tiion::ition      ; ex: partition, definition, condition, position, transition
    :C?:tiioning::itioning
    :C?:tiions::itions
    :C?:tiive::itive      ; ex: positive, primitive, repetitive, transitive, additive
    :C?:tiives::itives
    :C?:ivley::ively      ; ex: relatively, actively, intrusively, recursively, productively
    :C?:iivty::ivity      ; ex: connectivity, sensitivity, productivity, activity, inactivity
    :C?:iviyt::ivity
    :C?:iezd::ized        ; ex: equalized, synchronized, amortized, randomized, memorized
    :C?:alble::lable      ; ex: available, callable, scalable, unscalable, calculable
    :C?:ltiy::lity        ; ex: probability, stability, quality, capability, utility
    :C?:liyt::lity
    :C?:laod::load        ; ex: overload, download, upload, workload, offload
    :C?:laoded::loaded
    :C?:laoder::loader
    :C?:laods::loads
    :C?:amte::mate        ; ex: approximate, estimate, animate, automate, summate
    :C?:amtes::mates
    :C?:maion::mation     ; ex: information, summation, automation, estimation, animation
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
    :C?:mzie::mize        ; ex: customize, minimize, maximize, optimize, randomize
    :C?:mzied::mized
    :C?:mzies::mizes

    :C?:ntae::nate        ; ex: concatenate, eliminate, alternate, coordinate, terminate
    :C?:naet::nate
    :C?:ntaes::nates
    :C?:naets::nates
    :C?:ntiy::nity        ; ex: infinity, opportunity, sanity, vicinity, unity
    :C?:tnation::ntation  ; ex: representation, orientation, segmentation, documentation, implementation
    :C?:tnations::ntations
    :C?:tner::nter        ; ex: encounter, pointer, printer, counter, linter
    :C?:tners::nters
    :C?:oitn::oint        ; ex: powerpoint, breakpoint, disjoint, watchpoint, logpoint
    :C?:iont::oint
    :C?:onit::oint
    :C?:oitns::oints
    :C?:ionts::oints
    :C?:onits::oints
    :C?:oudn::ound        ; ex: background, foreground, compound, sound, round
    :C?:oudns::ounds
    :C?:outn::ount        ; ex: count, account, amount, discount, mount
    :C?:outns::ounts
    :C?:paeg::page        ; ex: page, homepage, webpage, stoppage, subpage
    :C?:opint::point      ; ex: midpoint, breakpoint, checkpoint, logpoint, powerpoint
    :C?:opints::points
    :C?:prot::port        ; ex: import, export, support, transport, report
    :C?:prots::ports
    :C?:raeg::rage        ; ex: coverage, average, storage, leverage, overage
    :C?:rnat::rant        ; ex: grant, entrant, reentrant, quadrant, tolerant
    :C?:rnats::rants
    :C?:raet::rate        ; ex: enumerate, migrate, integrate, generate, iterate
    :C?:raets::rates
    :C?:rtiy::rity        ; ex: security, priority, parity, integrity, modularity
    :C?:rvoe::rove        ; ex: improve, approve, prove, disprove, drove
    :C?:rvoes::roves
    :C?:sehd::shed        ; ex: distinguished, flushed, pushed, published, finished
    :C?:shsed::shed
    :C?:shesd::shed
    :C?:hsing::shing      ; ex: refreshing, publishing, hashing, smashing, flushing
    :C?:saeg::sage        ; ex: message, usage, misusage, myMessage, passage
    :C?:sihp::ship        ; ex: relationship, ownership, spaceship (operator), membership, leadership
    :C?:sihps::ships
    :C?:sino::sion        ; ex: expression, recursion, comprehension, version, permission, dimension
    :C?:soin::sion
    :C?:oisn::sion
    :C?:soins::sions
    :C?:sinos::sions
    :C?:oisns::sions
    :C?:stiy::sity        ; ex: sparsity, necessity, diversity, intensity, falsity
    :C?:svie::sive        ; ex: recursive, expressive, permissive, inclusive, successive
    :C?:srot::sort        ; ex: sort, mergesort, quicksort, heapsort, timsort
    :C?:sapce::space      ; ex: workspace, backspace, namespace, subspace, cyberspace
    :C?:spcae::space
    :C?:sapces::spaces
    :C?:spcaes::spaces

    :C?:taeg::tage        ; ex: advantage, shortage, outage, stage, percentage
    :C?:tnat::tant        ; ex: constant, important, instant, distant, inhabitant
    :C?:tatn::tant
    :C?:tnats::tants
    :C?:tatns::tants
    :C?:thces::tches      ; ex: catches, batches, switches, matches, glitches
    :C?:tenet::tent       ; ex: persistent, content, existent, latent, consistent
    :C?:tehr::ther        ; ex: another, either, other, together, gather
    :C?:hting::thing      ; ex: thing, something, anything, nothing, smoothing
    :C?:itfy::tify        ; ex: identify, justify, notify, sastisfy, certify
    :C?:itme::time        ; ex: lifetime, realtime, uptime, downtime, runtime
    :C?:tiem::time
    :C?:itmes::times
    :C?:tiems::times
    :C?:itng::ting        ; ex: selecting, testing, printing, routing, collecting
    :C?:iton::tion        ; ex: function, exception, condition, transaction, authentication
    :C?:tino::tion
    :C?:toin::tion
    :C?:iotn::tion
    :C?:itons::tions
    :C?:tinos::tions
    :C?:toins::tions
    :C?:iotns::tions
    :C?:tiosn::tions
    :C?:itonal::tional    ; ex: directional, functional, positional, conditional, operational
    :C?:tvie::tive        ; ex: generative, active, relative, effective, primitive
    :C?:otry::tory        ; ex: directory, factory, history, inventory, repository
    :C?:tuer::ture        ; ex: feature, picture, future, structure, capture
    :C?:tuers::tures
    :C?:ullly::ully       ; ex: successfully, carefully, restfully, watchfully, skillfully
    :C?:ulyl::ully
    :C?:utls::ults        ; ex: results, testResults, defaults, faults, segfaults
    :C?:tued::uted        ; ex: executed, permuted, contributed, distributed, computed
    :C?:tues::utes        ; ex: executes, attributes, routes, computes, permutes
    :C?:tuion::ution      ; ex: execution, resolution, solution, distribution, contribution
    :C?:tuions::utions
    :C?:veyr::very        ; ex: very, every, delivery, discovery, recovery
    :C?:vtiy::vity        ; ex: activity, connectivity, sensitivity, productivity, relativity
    :C?:wrae::ware        ; ex: software, hardware, shareware, firmware, courseware
    :C?:owrk::work        ; ex: work, network, framework, rework, coursework
    :C?:wokr::work
    :C?:owrks::works
    :C?:wokrs::works
#HotIf
