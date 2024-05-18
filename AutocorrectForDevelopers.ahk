#Requires AutoHotkey v2 ; note: v1 is also supported, see https://github.com/tnear/AutocorrectForDevelopers
#SingleInstance Force

; INTRODUCTION
; AutocorrectForDevelopers is an AutoHotkey script which automatically fixes typos
; using rules tailored for software developer environments. The rules in this script
; contain many corrections for common developer words involving keywords, classes,
; methods, programming languages, and programming disciplines.
; The latest version is located here: https://github.com/tnear/AutocorrectForDevelopers

; DOCUMENTATION
; AHK hotstrings: https://www.autohotkey.com/docs/v2/Hotstrings.htm
; :C: = Match case.
; :*: = Ending char not required. Often added to encompass substrings.
;       For example, this rule -> :*:ansewr::answer
;       ...will convert 'ansewr' -> 'answer' before typing an ending character.
;       This lets it match 'answer', 'answers', 'answered', ...
; :?: = matches inside other words used for suffixes, ex, :?:tign::ting => testign -> testing.
;       The '?' option still needs an ending character.
; Useful dictionary search tools:
;   Prefix: https://www.litscape.com/word_tools/starts_with.php
;   Suffix: https://www.litscape.com/word_tools/ends_with.php
; Contains: https://www.litscape.com/word_tools/contains_sequence.php

; END CHARACTERS
; The line below add these characters to the supported ending characters:
;   - '<' and '>' are useful for C++ templates
;   - '*' is useful for pointers
;   - '`' is useful for Markdown (note: the '`' char must be escaped as '``')
;   - '=' is useful for comparisons
;   - '&' is useful for AND expressions
;   - '|' is useful for OR expressions
; Note: all other EndChars characters below are default AHK end characters:
#Hotstring EndChars -()[]{}:;'"/\,.?!`n `t<>*``=&|

; AHK VERSION 1 vs. VERSION 2
; Relevant AutocorrectForDevelopers v1 <=> v2 differences:
; Directives: #HotIf (v2) is #If (v1)
; For literal colons, each colon needs to be escaped in v2
; For example, to encode '::', escape each colon --> `:`:
;     For v1, you only need to escape double colon --> `::

; AUTOCORRECT SCRIPT
; Exclude AHK script from MS Word because it already has an autocorrect
; (although MS Word doesn't emphasize programming words).
; Note: this conditional can be changed to include or exclude other applications.
#HotIf !WinActive('ahk_exe WINWORD.exe')

    ; WHITELIST
    ; Start by listing the whitelist (permit these words by setting backspace to zero, b0)
    ;     Note: the whitelist section must be above suffix section

    ; -ailly word suffix whitelist (do not convert these to -ially)
    :b0:ailly::
    :b0:bailly::
    :b0:cailly::
    :b0:dailly::
    :b0:frailly::
    :b0:hailly::
    :b0:mailly::
    {
    }

    ; -aite word suffix whitelist (do not convert these to -iate)
    :b0:aite::
    :b0:ilvaite::
    :b0:waite::
    {
        ; waite = surname
    }

    ; -aites word suffix whitelist (do not convert these to -iates)
    :b0:aites::
    :b0:ilvaites::
    :b0:waites::
    {
    }

    ; -atie word suffix whitelist (do not convert these to -ative)
    :b0:atie::
    :b0:catie::
    :b0:katie::
    {
    }

    ; -atro word suffix whitelist (do not convert these to -ator)
    :b0:atro::
    :b0:cuatro::
    {
    }

    ; -atros word suffix whitelist (do not convert these to -ators)
    :b0:atros::
    :b0:albatros::
    :b0:cuatros::
    {
    }

    ; -dner word suffix whitelist (do not convert these to -nder)
    :b0:dner::
    :b0:gardner::
    {
    }

    ; -dners word suffix whitelist (do not convert these to -nders)
    :b0:dners::
    :b0:gardners::
    {
    }

    ; -dres word suffix whitelist (do not convert these to -ders)
    :b0:dres::
    :b0:padres::
    {
    }

    ; -eint word suffix whitelist (do not convert these to -ient)
    :b0:eint::
    :b0:feint::
    {
    }

    ; -ianed word suffix whitelist (do not convert these to -ained)
    :b0:ianed::
    :b0:ruffianed::
    {
    }

    ; -iarty word suffix whitelist (do not convert these to -arity)
    :b0:iarty::
    :b0:moriarty::
    {
    }

    ; -ign word suffix whitelist (do not convert these to -ing)
    :b0:ign::
    :b0:align::
    :b0:arraign::
    :?b0:assign::               ; '?' breaks correcting of passign/surpassign/etc but at the benefit
                                ; of permitting 'assign' to be used a suffix such as 'varToAssign'
    :b0:benign::
    :b0:beign::                 ; not a word, but ambiguous between 'begin' and 'being'
    :b0:bign::
    :b0:campaign::
    :b0:condign::
    :b0:consign::
    :b0:cosign::
    :b0:countersign::
    :b0:deign::
    :b0:deraign::
    :?b0:design::               ; '?' to allow design as a suffix, such as 'SystemDesign'
    :b0:disalign::
    :b0:eloign::
    :b0:ensign::
    :b0:feign::
    :?b0:foreign::
    :b0:gign::
    :b0:lign::
    :b0:malign::
    :b0:misalign::
    :b0:outreign::
    :b0:realign::
    :b0:reconsign::
    :b0:reign::
    :b0:resign::
    :b0:roadsign::
    :b0:sign::
    :b0:sovereign::
    :b0:unalign::
    :b0:unbenign::
    :b0:undersign::
    :b0:unsign::
    :b0:zign::
    {
    }

    ; -igns word suffix whitelist (do not convert these to -ings)
    :b0:igns::
    :b0:aligns::
    :b0:arraigns::
    :b0:assigns::
    :b0:campaigns::
    :b0:consigns::
    :b0:coreigns::
    :b0:cosigns::
    :b0:countersigns::
    :b0:dealigns::
    :?b0:designs::
    :b0:disaligns::
    :b0:eloigns::
    :b0:ensigns::
    :b0:feigns::
    :b0:foreigns::
    :b0:maligns::
    :b0:misaligns::
    :b0:misassigns::
    :b0:outreigns::
    :b0:preassigns::
    :b0:reassigns::
    :b0:reconsigns::
    :b0:reigns::
    :b0:resigns::
    :b0:roadsigns::
    :b0:signs::
    :b0:sovereigns::
    :b0:unaligns::
    :b0:unassigns::
    :b0:undersigns::
    {
    }

    ; -itonal word suffix whitelist (do not convert these to -tional)
    :b0:itonal::
    :b0:baritonal::
    {
    }

    ; -itonally word suffix whitelist (do not convert these to -tionally)
    :b0:itonally::
    :b0:intraperitonally::
    {
    }

    ; -laize word suffix whitelist (do not convert these to -alize)
    :b0:laize::
    :b0:formulaize::
    {
    }

    ; -leing word suffix whitelist (do not convert these to -eling)
    :b0:leing::
    :b0:deleing::
    :b0:facsimileing::
    {
    }

    ; -mnet word suffix whitelist (do not convert these to -ment)
    :b0:mnet::
    :b0:boomnet::
    {
    }

    ; -nace word suffix whitelist (do not convert these to -ance)
    :b0:nace::
    :b0:furnace::
    :b0:menace::
    {
    }

    ; -naced word suffix whitelist (do not convert these to -anced)
    :b0:naced::
    :b0:furnaced::
    :b0:menaced::
    {
    }

    ; -naces word suffix whitelist (do not convert these to -ances)
    :b0:naces::
    :b0:furnaces::
    :b0:menaces::
    {
    }

    ; -nices word suffix whitelist (do not convert these to -ncies)
    :b0:nices::
    :b0:cornices::
    {
    }

    ; -nig word suffix whitelist (do not convert these to -ing)
    :b0:nig::
    :b0:anig::
    :b0:enig::
    :b0:inig::
    :b0:knig::
    :b0:nnig::
    :b0:snig::
    :b0:unig::
    {
    }

    ; -ntae word suffix whitelist (do not convert these to -nate)
    :b0:ntae::
    :b0:placentae::
    {
    }

    ; -otins word suffix whitelist (do not convert these to -tions)
    :b0:otins::
    :b0:biotins::
    {
    }

    ; -otry word suffix whitelist (do not convert these to -tory)
    :b0:otry::
    :b0:bigotry::
    :b0:harlotry::
    :b0:quixotry::
    :b0:zealotry::
    {
    }

    ; -ouis word suffix whitelist (do not convert these to -ious)
    :b0:ouis::
    :b0:louis::
    {
    }

    ; -raes word suffix whitelist (do not convert these to -ares)
    :b0:raes::
    :b0:vertebraes::
    {
    }

    ; -roed word suffix whitelist (do not convert these to -ored)
    :b0:roed::
    :b0:rezored::
    :b0:zeroed::
    {
    }

    ; -rued word suffix whitelist (do not convert these to -ured)
    :b0:rued::
    :b0:accrued::
    :b0:construed::
    :b0:misconstrued::
    :b0:unaccrued::
    {
    }

    ; -sino word suffix whitelist (do not convert these to -sion)
    :b0:sino::
    :b0:casino::
    {
    }

    ; -sinos word suffix whitelist (do not convert these to -sions)
    :b0:sinos::
    :b0:casinos::
    {
    }

    ; -soed word suffix whitelist (do not convert these to -osed)
    :b0:soed::
    :b0:lassoed::
    {
    }

    ; -taul word suffix whitelist (do not convert these to -tual)
    :b0:taul::
    :b0:ataul::
    {
    }

    ; -tino word suffix whitelist (do not convert these to -tion)
    :b0:tino::
    :b0:agostino::
    :b0:constantino::
    :b0:cupertino::
    :b0:faustino::
    :b0:latino::
    :b0:martino::
    :b0:santino::
    :b0:totino::
    :b0:valentino::
    :b0:celestino::
    :b0:florentino::
    :b0:sabatino::
    :b0:augustino::
    :b0:bertino::
    :b0:fortino::
    {
    }

    ; -tinos word suffix whitelist (do not convert these to -tions)
    :b0:tinos::
    :b0:agostinos::
    :b0:constantinos::
    :b0:cupertinos::
    :b0:faustinos::
    :b0:latinos::
    :b0:martinos::
    :b0:santinos::
    :b0:totinos::
    :b0:valentinos::
    :b0:celestinos::
    :b0:florentinos::
    :b0:sabatinos::
    :b0:augustinos::
    :b0:bertinos::
    :b0:fortinos::
    {
    }

    ; -tley word suffix whitelist (do not convert these to -tely)
    :b0:tley::
    :b0:bentley::
    :b0:motley::
    {
    }

    ; -tued word suffix whitelist (do not convert these to -uted)
    :b0:tued::
    :b0:statued::
    {
    }

    ; -tues word suffix whitelist (do not convert these to -utes)
    :b0:tues::
    :b0:statues::
    :b0:virtues::
    {
    }

    ; -utre word suffix whitelist (do not convert these to -ture)
    :b0:utre::
    :b0:accoutre::
    {
    }

    ; -utred word suffix whitelist (do not convert these to -tured)
    :b0:utred::
    :b0:accoutred::
    {
    }

    ; -utres word suffix whitelist (do not convert these to -tures)
    :b0:utres::
    :b0:accoutres::
    {
    }

    ; whitelist suffixes (only autocorrect these when they appear as suffixes, see bottom of script)
    :b0:acne::         ; do not convert this string to -ance
    :b0:acned::        ; do not convert this string to -anced
    :b0:acnes::        ; do not convert this string to -ances
    :b0:aegd::         ; do not convert this string to -aged
    :b0:aenous::       ; do not convert this string to -aneous
    :b0:aenously::     ; do not convert this string to -aneously
    :b0:aesd::         ; do not convert this string to -ased
    :b0:aesr::         ; do not convert this string to -aser
    :b0:aesrs::        ; do not convert this string to -asers
    :b0:aetd::         ; do not convert this string to -ated
    :b0:aetly::        ; do not convert this string to -ately
    :b0:alble::        ; do not convert this string to -lable
    :b0:aible::        ; do not convert this string to -iable
    :b0:aiend::        ; do not convert this string to -ained
    :b0:airty::        ; do not convert this string to -arity
    :b0:aisn::         ; do not convert this string to -ains
    :b0:aitvely::      ; do not convert this string to -atively
    :b0:alyed::        ; do not convert this string to -layed
    :b0:aotin::        ; do not convert this string to -ation
    :b0:athc::         ; do not convert this string to -atch
    :b0:athces::       ; do not convert this string to -atches
    :b0:atiely::       ; do not convert this string to -atively
    :b0:avte::         ; do not convert this string to -vate
    :b0:avted::        ; do not convert this string to -vated
    :b0:avtes::        ; do not convert this string to -vates
    :b0:awre::         ; do not convert this string to -ware
    :b0:bilties::      ; do not convert this string to -bilities
    :b0:bilites::      ; do not convert this string to -bilities
    :b0:blites::       ; do not convert this string to -bilities
    :b0:blities::      ; do not convert this string to -bilities
    :b0:biilties::     ; do not convert this string to -bilities
    :b0:bilty::        ; do not convert this string to -bility
    :b0:blity::        ; do not convert this string to -bility
    :b0:borad::        ; do not convert this string to -board
    :b0:caction::      ; do not convert this string to -cation
    :b0:cactions::     ; do not convert this string to -cations
    :b0:caet::         ; do not convert this string to -cate
    :b0:caets::        ; do not convert this string to -cates
    :b0:caion::        ; do not convert this string to -cation
    :b0:caions::       ; do not convert this string to -cations
    :b0:cesr::         ; do not convert this string to -cers
    :b0:clty::         ; do not convert this string to -ctly
    :b0:dadtion::      ; do not convert this string to -dation
    :b0:daet::         ; do not convert this string to -date
    :b0:denet::        ; do not convert this string to -dent
    :b0:denets::       ; do not convert this string to -dents
    :b0:detn::         ; do not convert this string to -dent
    :b0:detns::        ; do not convert this string to -dents
    :b0:dned::         ; do not convert this string to -nded
    :b0:dning::        ; do not convert this string to -nding
    :b0:dutc::         ; do not convert this string to -duct
    :b0:dutcion::      ; do not convert this string to -duction
    :b0:dutcs::        ; do not convert this string to -ducts
    :b0:earting::      ; do not convert this string to -erating
    :b0:eince::        ; do not convert this string to -ience
    :b0:einces::       ; do not convert this string to -iences
    :b0:eintly::       ; do not convert this string to -iently
    :b0:eitn::         ; do not convert this string to -ient
    :b0:eitns::        ; do not convert this string to -ients
    :b0:emnt::         ; do not convert this string to -ment
    :b0:emnted::       ; do not convert this string to -mented
    :b0:emnts::        ; do not convert this string to -ments
    :b0:enyc::         ; do not convert this string to -ency
    :b0:erla::         ; do not convert this string to -eral
    :b0:erlas::        ; do not convert this string to -erals
    :b0:fomr::         ; do not convert this string to -form
    :b0:gaes::         ; do not convert this string to -ages
    :b0:gaion::        ; do not convert this string to -gation
    :b0:gaions::       ; do not convert this string to -gations
    :b0:garphy::       ; do not convert this string to -graphy
    :b0:getn::         ; do not convert this string to -gent

    :b0:hced::         ; do not convert this string to -ched
    :b0:hcer::         ; do not convert this string to -cher
    :b0:hcers::        ; do not convert this string to -chers
    :b0:hcing::        ; do not convert this string to -ching
    :b0:hicng::        ; do not convert this string to -ching
    :b0:hsing::        ; do not convert this string to -shing
    :b0:iaction::      ; do not convert this string to -ication
    :b0:ialy::         ; do not convert this string to -ially
    :b0:iaml::         ; do not convert this string to -imal
    :b0:ianl::         ; do not convert this string to -inal
    :b0:icla::         ; do not convert this string to -ical
    :b0:idng::         ; do not convert this string to -ding
    :b0:idngs::        ; do not convert this string to -dings
    :b0:idtion::       ; do not convert this string to -dition
    :b0:idtional::     ; do not convert this string to -ditional
    :b0:idtions::      ; do not convert this string to -ditions
    :b0:iecne::        ; do not convert this string to -ience
    :b0:iecnes::       ; do not convert this string to -iences
    :b0:ienet::        ; do not convert this string to -ient
    :b0:ienets::       ; do not convert this string to -ients
    :b0:ienr::         ; do not convert this string to -iner
    :b0:ienrs::        ; do not convert this string to -iners
    :b0:ietn::         ; do not convert this string to -ient
    :b0:ietnly::       ; do not convert this string to -iently
    :b0:ietns::        ; do not convert this string to -ients
    :b0:iezd::         ; do not convert this string to -ized
    :b0:iezr::         ; do not convert this string to -izer
    :b0:iezrs::        ; do not convert this string to -izers
    :b0:igth::         ; do not convert this string to -ight
    :b0:igths::        ; do not convert this string to -ights
    :b0:ihgt::         ; do not convert this string to -ight
    :b0:iicent::       ; do not convert this string to -icient
    :b0:iicently::     ; do not convert this string to -iciently
    :b0:iifc::         ; do not convert this string to -ific
    :b0:iifed::        ; do not convert this string to -ified
    :b0:iifer::        ; do not convert this string to -ifier
    :b0:iifers::       ; do not convert this string to -ifiers
    :b0:iifes::        ; do not convert this string to -ifies
    :b0:iified::       ; do not convert this string to -ified
    :b0:iifier::       ; do not convert this string to -ifier
    :b0:iifiers::      ; do not convert this string to -ifiers
    :b0:iifies::       ; do not convert this string to -ifies
    :b0:iison::        ; do not convert this string to -ision
    :b0:iisons::       ; do not convert this string to -isions
    :b0:iites::        ; do not convert this string to -ities
    :b0:iivty::        ; do not convert this string to -ivity
    :b0:ilbity::       ; do not convert this string to -bility
    :b0:inat::         ; do not convert this string to -iant
    :b0:indg::         ; do not convert this string to -ding
    :b0:indgs::        ; do not convert this string to -dings
    :b0:ioanl::        ; do not convert this string to -ional
    :b0:ioanlly::      ; do not convert this string to -ionally
    :b0:iont::         ; do not convert this string to -oint
    :b0:ionts::        ; do not convert this string to -oints
    :b0:iosu::         ; do not convert this string to -ious
    :b0:iosuly::       ; do not convert this string to -iously
    :b0:iotn::         ; do not convert this string to -tion
    :b0:iotns::        ; do not convert this string to -tions
    :b0:irng::         ; do not convert this string to -ring
    :b0:irngs::        ; do not convert this string to -rings
    :b0:isde::         ; do not convert this string to -side
    :b0:isdes::        ; do not convert this string to -sides
    :b0:issng::        ; do not convert this string to -ssing
    :b0:itfy::         ; do not convert this string to -tify
    :b0:ityf::         ; do not convert this string to -tify
    :b0:itme::         ; do not convert this string to -time or -items
    :b0:itmes::        ; do not convert this string to -times or -items
    :b0:itng::         ; do not convert this string to -ting
    :b0:itnoal::       ; do not convert this string to -tional
    :b0:itnoally::     ; do not convert this string to -tionally
    :b0:iton::         ; do not convert this string to -tion
    :b0:itons::        ; do not convert this string to -tions
    :b0:ivley::        ; do not convert this string to -ively
    :b0:iviyt::        ; do not convert this string to -ivity
    :b0:iwng::         ; do not convert this string to -wing
    :b0:kaes::         ; do not convert this string to -akes
    :b0:kced::         ; do not convert this string to -cked
    :b0:kcer::         ; do not convert this string to -cker
    :b0:kcers::        ; do not convert this string to -ckers
    :b0:kcet::         ; do not convert this string to -cket
    :b0:kcets::        ; do not convert this string to -ckets
    :b0:kcing::        ; do not convert this string to -cking
    :b0:kning::        ; do not convert this string to -nking
    :b0:laized::       ; do not convert this string to -alized
    :b0:laizes::       ; do not convert this string to -alizes
    :b0:laly::         ; do not convert this string to -ally
    :b0:lelr::         ; do not convert this string to -ller
    :b0:liez::         ; do not convert this string to -lize
    :b0:liity::        ; do not convert this string to -ility
    :b0:litiy::        ; do not convert this string to -lity
    :b0:liyt::         ; do not convert this string to -lity
    :b0:lnie::         ; do not convert this string to -line
    :b0:ltiy::         ; do not convert this string to -lity
    :b0:luar::         ; do not convert this string to -ular
    :b0:lzie::         ; do not convert this string to -lize
    :b0:lzied::        ; do not convert this string to -lized
    :b0:lzier::        ; do not convert this string to -lizer
    :b0:maeg::         ; do not convert this string to -mage
    :b0:maion::        ; do not convert this string to -mation
    :b0:maions::       ; do not convert this string to -mations
    :b0:meent::        ; do not convert this string to -ment
    :b0:meented::      ; do not convert this string to -mented
    :b0:meents::       ; do not convert this string to -ments
    :b0:menet::        ; do not convert this string to -ment
    :b0:meneted::      ; do not convert this string to -mented
    :b0:menets::       ; do not convert this string to -ments
    :b0:metn::         ; do not convert this string to -ment
    :b0:metns::        ; do not convert this string to -ments
    :b0:mneted::       ; do not convert this string to -mented
    :b0:mnets::        ; do not convert this string to -ments
    :b0:mzie::         ; do not convert this string to -mize
    :b0:mzied::        ; do not convert this string to -mized
    :b0:mzier::        ; do not convert this string to -mizer
    :b0:mzies::        ; do not convert this string to -mizes

    :b0:naet::         ; do not convert this string to -nate
    :b0:naets::        ; do not convert this string to -nates
    :b0:necy::         ; do not convert this string to -ency
    :b0:netion::       ; do not convert this string to -ention
    :b0:netions::      ; do not convert this string to -entions
    :b0:netly::        ; do not convert this string to -ently
    :b0:nicng::        ; do not convert this string to -ncing
    :b0:nigs::         ; do not convert this string to -ings
    :b0:ntaes::        ; do not convert this string to -nates
    :b0:ntiy::         ; do not convert this string to -nity
    :b0:oiusly::       ; do not convert this string to -iously
    :b0:oekr::         ; do not convert this string to -oker
    :b0:oend::         ; do not convert this string to -oned
    :b0:oewr::         ; do not convert this string to -ower
    :b0:oewrs::        ; do not convert this string to -owers
    :b0:oeus::         ; do not convert this string to -eous
    :b0:oeusly::       ; do not convert this string to -eously
    :b0:oinal::        ; do not convert this string to -ional
    :b0:oinally::      ; do not convert this string to -ionally
    :b0:oitn::         ; do not convert this string to -oint
    :b0:oitns::        ; do not convert this string to -oints
    :b0:oius::         ; do not convert this string to -ious
    :b0:okcs::         ; do not convert this string to -ocks
    :b0:onit::         ; do not convert this string to -oint
    :b0:onits::        ; do not convert this string to -oints
    :b0:otyr::         ; do not convert this string to -tory
    :b0:ouisly::       ; do not convert this string to -iously
    :b0:pepr::         ; do not convert this string to -pper
    :b0:prot::         ; do not convert this string to -port
    :b0:proted::       ; do not convert this string to -ported
    :b0:proter::       ; do not convert this string to -porter
    :b0:proters::      ; do not convert this string to -porters
    :b0:prots::        ; do not convert this string to -ports
    :b0:riing::        ; do not convert this string to -iring
    :b0:riyt::         ; do not convert this string to -rity
    :b0:rnat::         ; do not convert this string to -rant
    :b0:rtiy::         ; do not convert this string to -rity
    :b0:oisn::         ; do not convert this string to -sion
    :b0:oisns::        ; do not convert this string to -sions
    :b0:opse::         ; do not convert this string to -pose
    :b0:oreis::        ; do not convert this string to -ories
    :b0:oudn::         ; do not convert this string to -ound
    :b0:oudns::        ; do not convert this string to -ounds
    :b0:outn::         ; do not convert this string to -ount
    :b0:outns::        ; do not convert this string to -ounts
    :b0:raeg::         ; do not convert this string to -rage
    :b0:rekd::         ; do not convert this string to -rked
    :b0:remd::         ; do not convert this string to -rmed
    :b0:retnly::       ; do not convert this string to -rently
    :b0:rila::         ; do not convert this string to -rial
    :b0:ritiy::        ; do not convert this string to -rity
    :b0:rvoe::         ; do not convert this string to -rove
    :b0:rvoed::        ; do not convert this string to -roved
    :b0:rvoes::        ; do not convert this string to -roves
    :b0:saeg::         ; do not convert this string to -sage
    :b0:sehd::         ; do not convert this string to -shed
    :b0:shpi::         ; do not convert this string to -ship
    :b0:sisng::        ; do not convert this string to -ssing
    :b0:sitc::         ; do not convert this string to -stic
    :b0:sitcal::       ; do not convert this string to -stical
    :b0:snive::        ; do not convert this string to -nsive
    :b0:sntat::        ; do not convert this string to -stant
    :b0:sntats::       ; do not convert this string to -stants
    :b0:soin::         ; do not convert this string to -sion
    :b0:soins::        ; do not convert this string to -sions
    :b0:stiy::         ; do not convert this string to -sity
    :b0:svie::         ; do not convert this string to -sive
    :b0:sviely::       ; do not convert this string to -sively

    :b0:taed::         ; do not convert this string to -ated
    :b0:taeg::         ; do not convert this string to -tage
    :b0:taion::        ; do not convert this string to -ation
    :b0:taions::       ; do not convert this string to -ations
    :b0:taive::        ; do not convert this string to -ative
    :b0:taively::      ; do not convert this string to -atively
    :b0:taoin::        ; do not convert this string to -ation
    :b0:taoins::       ; do not convert this string to -ations
    :b0:tatn::         ; do not convert this string to -tant
    :b0:tatnly::       ; do not convert this string to -tantly
    :b0:tatns::        ; do not convert this string to -tants
    :b0:taully::       ; do not convert this string to -tually
    :b0:tayr::         ; do not convert this string to -tary
    :b0:tehr::         ; do not convert this string to -ther
    :b0:tenet::        ; do not convert this string to -tent
    :b0:tesr::         ; do not convert this string to -ters
    :b0:tetd::         ; do not convert this string to -tted
    :b0:thces::        ; do not convert this string to -tches
    :b0:taional::      ; do not convert this string to -ational
    :b0:tien::         ; do not convert this string to -tine
    :b0:tiens::        ; do not convert this string to -tines
    :b0:tiies::        ; do not convert this string to -ities
    :b0:tiing::        ; do not convert this string to -iting
    :b0:tiion::        ; do not convert this string to -ition
    :b0:tiioning::     ; do not convert this string to -itioning
    :b0:tiions::       ; do not convert this string to -itions
    :b0:tiive::        ; do not convert this string to -itive
    :b0:tiively::      ; do not convert this string to -itively
    :b0:tiives::       ; do not convert this string to -itives
    :b0:tinoal::       ; do not convert this string to -tional
    :b0:tinoally::     ; do not convert this string to -tionally
    :b0:tiosn::        ; do not convert this string to -tions
    :b0:tiyf::         ; do not convert this string to -tify
    :b0:tnat::         ; do not convert this string to -tant
    :b0:tnatly::       ; do not convert this string to -tantly
    :b0:tnats::        ; do not convert this string to -tants
    :b0:tnation::      ; do not convert this string to -ntation
    :b0:tnations::     ; do not convert this string to -ntations
    :b0:tned::         ; do not convert this string to -nted
    :b0:toin::         ; do not convert this string to -tion
    :b0:toins::        ; do not convert this string to -tions
    :b0:tped::         ; do not convert this string to -pted
    :b0:tpion::        ; do not convert this string to -ption
    :b0:tpions::       ; do not convert this string to -ptions
    :b0:tpive::        ; do not convert this string to -ptive
    :b0:tsed::         ; do not convert this string to -sted
    :b0:tsic::         ; do not convert this string to -stic
    :b0:tsics::        ; do not convert this string to -stics
    :b0:tsration::     ; do not convert this string to -stration
    :b0:tsrations::    ; do not convert this string to -strations
    :b0:tuer::         ; do not convert this string to -ture
    :b0:tuerd::        ; do not convert this string to -tured
    :b0:tuers::        ; do not convert this string to -tures
    :b0:tues::         ; do not convert this string to -utes
    :b0:tuing::        ; do not convert this string to -uting
    :b0:tuion::        ; do not convert this string to -ution
    :b0:tuions::       ; do not convert this string to -utions
    :b0:tvie::         ; do not convert this string to -tive
    :b0:tviely::       ; do not convert this string to -tively
    :b0:tvies::        ; do not convert this string to -tives
    :b0:ualr::         ; do not convert this string to -ular
    :b0:ullly::        ; do not convert this string to -ully
    :b0:ulyl::         ; do not convert this string to -ully
    :b0:utls::         ; do not convert this string to -ults
    :b0:vaet::         ; do not convert this string to -vate
    :b0:vaets::        ; do not convert this string to -vates
    :b0:vesr::         ; do not convert this string to -vers
    :b0:vtiy::         ; do not convert this string to -vity
    :b0:waer::         ; do not convert this string to -ware
    :b0:wrae::         ; do not convert this string to -ware
    {
        ; see bottom of script for examples of these suffixes
    }

    ; PRIMARY AUTOCORRECT LIST
    ; Autocorrect these strings.
    ; Basic syntax -> ::oldString::newString

    :C:#Include::{#}include         ; directive in C/C++. note: a '#' on RHS must be escaped by enclosing in '{}'
    :C:#Pragma::{#}pragma           ; directive in C/C++
    :*b0:{`n`n]::{bs 1}{}}          ; convert '{\n\n]' to '{\n\n}' by backspacing once which replaces ']' with '}'

    ::alot::a lot
    ::abotu::about
    ::aobut::about
    ::baout::about
    ::abvoe::above
    ::absoltue::absolute
    :*:abstarct::abstract           ; abstract/s, abstracted, abstraction/s
    :*:accetp::accept               ; accept/s/ed/ing/able
    :*:acceess::access
    ::accessibel::accessible
    :*:accomodat::accommodat        ; accommodate/s/d, accommodating
    ::accomplihs::accomplish
    ::accomplihses::accomplishes
    :*:acount::account              ; account/s/ed/ing/able
    :*:accumualt::accumulat         ; accumulat/ed/es/or/ing
    :*:accumlat::accumulat
    ::accruacy::accuracy
    ::accruate::accurate
    :*:ahciev::achiev               ; achiev/able/e/es/ed/ing/ement
    :*:acknowlege::acknowledge      ; acknowledge/d/s/ment/ments
    :*:acknwoledge::acknowledge
    :*:ackonwledge::acknowledge
    ::acqurie::acquire
    ::acqruie::acquire
    ::acquried::acquired
    ::acqruied::acquired
    ::acquries::acquires
    ::acqruies::acquires
    ::actula::actual
    ::acutal::actual
    :*:adress::address              ; address/ed/es/ing/able
    ::adjancecy::adjacency
    ::adjancency::adjacency
    ::adjacnet::adjacent
    ::adjancent::adjacent
    ::adjacenet::adjacent
    :*:ajdust::adjust               ; adjust/s/ed/er/ing/ment
    :*:adjsut::adjust
    ::adjustible::adjustable
    ::adminstrator::administrator
    ::administator::administrator
    ::adminstrators::administrators
    ::administators::administrators
    :*:addvance::advance            ; advance/d/r/s
    :*:avdance::advance
    ::advnatage::advantage
    ::advnatages::advantages
    ::agian::again
    ::agianst::against
    ::agetns::agents
    ::aggrivate::aggravate
    :*:agregat::aggregat            ; aggregat/e/ed/es/ion
    ::aehad::ahead
    ::algoirthm::algorithm
    ::algorihtm::algorithm
    ::algoirhtm::algorithm
    ::algroithm::algorithm
    ::algortihm::algorithm
    ::algorhtm::algorithm
    ::algorihm::algorithm
    ::algorthm::algorithm
    ::algorithim::algorithm
    ::algoirthms::algorithms
    ::algorihtms::algorithms
    ::algoirhtms::algorithms
    ::algroithms::algorithms
    ::algortihms::algorithms
    ::algorhtms::algorithms
    ::algorihms::algorithms
    ::algorthms::algorithms
    ::algorithims::algorithms
    ::algorithsm::algorithms
    ::alais::alias
    ::alaises::aliases
    :C:alvie::alive
    ::allcoate::allocate
    ::allcoated::allocated
    ::allcoates::allocates
    :C*:allwo::allow                ; allow/s/ed/ing/able. Case sensitive to avoid matches like 'allWords'
    ::allowabel::allowable
    ::almsot::almost
    :*:alhpa::alpha                 ; alpha/bet/betize/numeric
    ::alraedy::already
    ::alrady::already
    ::alreayd::already
    ::laready::already
    ::alerady::already
    ::alos::also
    :*:altenrat::alternat           ; alternat/e/ed/es/ing/ion
    ::alhtough::although
    ::alwasy::always
    ::alwyas::always
    ::analagous::analogous
    :C:adn::and
    :C:Adn::And
    :C:nad::and
    :C:ANd::And
    ::andthe::and the
    ::announcment::announcement
    ::announcments::announcements
    ::antoehr::another
    ::antoher::another
    :*:ansewr::answer               ; answer/s/ed/ing
    :*:naswer::answer
    ::anhyting::anything
    ::anyhting::anything
    ::appearence::appearance
    ::appearences::appearances
    ::apperas::appears
    ::appedn::append
    ::appication::application
    ::appilcation::application
    ::aplication::application
    ::applicaton::application
    ::appications::applications
    ::appilcations::applications
    ::aplications::applications
    ::applicatons::applications
    ::appleid::applied
    ::appleis::applies
    :*:apporach::approach           ; approach/es/ed/ing
    :*:aproach::approach
    :*:appraoch::approach
    :*:approahc::approach
    ::arbitrayr::arbitrary
    ::architecturla::architectural
    ::arhitecture::architecture
    ::archtiecture::architecture
    ::archvie::archive
    ::archvied::archived
    ::archvies::archives
    ::are nto::are not
    ::arne't::aren't
    ::arent'::aren't
    ::arn'et::aren't
    ::arugment::argument
    ::arguement::argument
    ::arguent::argument
    ::arugments::arguments
    ::arguements::arguments
    ::arguents::arguments
    ::arithemtic::arithmetic
    ::aorund::around
    :C:aray::array
    :*:arary::array                 ; array/s/ed, arrayfun (MATLAB)
    :*:arrray::array
    :C:ArayList::ArrayList          ; Java resizable array
    ::arays::arrays
    ::artifiical::artificial
    ::artifical::artificial
    ::assmebly::assembly
    :*:asert::assert                ; assert/s/ed/ing/ion, assertEqual, assertTrue
    :*:assrt::assert
    :*:asssert::assert
    :*:asserrt::assert
    :C:asserT::assert               ; holding shift and about to type '(' in: 'assert('
    :*:asesrt::assert
    :*:assesrt::assert
    :*:asser(::assert(
    :*:assert9::assert(             ; missing shift key
    ::assesment::assessment
    ::assesments::assessments
    ::asisgn::assign
    ::assing::assign
    ::asigned::assigned
    ::asisgned::assigned
    ::assinged::assigned
    ::asignment::assignment
    ::assingment::assignment
    ::asignments::assignments
    ::assingments::assignments
    ::asisgns::assigns
    ::assings::assigns
    :*:assocait::associat           ; ex: associat/e/ed/es/ing/ive
    :*:assocate::associate
    ::assoicative::associative
    ::assuem::assume
    ::asycn::async
    ::asynchornous::asynchronous
    ::asychrnous::asynchronous
    ::asyncrhonous::asynchronous
    ::asynchornously::asynchronously
    ::asychrnously::asynchronously
    ::asyncrhonously::asynchronously
    ::atmoic::atomic
    ::atmoics::atomics
    :*:atach::attach                ; ex: attach/ed/es/ment
    :*:attahc::attach
    ::attakc::attack
    ::attakcs::attacks
    :*:attemtp::attempt             ; attempt/s/ed/ing
    ::atribute::attribute
    ::attirbute::attribute
    ::attirubte::attribute
    ::attriubte::attribute
    ::attribtue::attribute
    ::atributes::attributes
    ::attirbutes::attributes
    ::attirubtes::attributes
    ::attriubtes::attributes
    ::auido::audio
    ::aduio::audio
    :*:authetnic::authentic         ; authentic/ate/ity/ator/ating
    :C:auot::auto                   ; C++ keyword
    :*:autocompelt::autocomplet     ; autocomplet/e/ed/es/ing/ion
    ::automted::automated
    ::avialability::availability
    ::avialable::available
    ::aveareg::average
    ::aveage::average
    ::avearge::average
    ::avearegs::averages
    ::aveages::averages
    ::avearges::averages
    ::aovid::avoid
    ::avodi::avoid
    ::aviod::avoid
    ::vaoid::avoid
    ::awiat::await
    ::awkae::awake

    ::backgorund::background
    ::backgournd::background
    ::bakcload::backload
    ::bakclog::backlog
    ::bakcspace::backspace
    :*:bakctrack::backtrack         ; backtrack/s/ed/ing
    :*:backtrakc::backtrack
    ::bakcward::backward
    ::backwrad::backward
    ::bakcwards::backwards
    ::backwrads::backwards
    :*:blaance::balance             ; balance/d/r/s/rs
    ::bandwith::bandwidth
    ::badnwidth::bandwidth
    ::bandiwdth::bandwidth
    ::bandwidht::bandwidth
    ::baselien::baseline
    ::baseilne::baseline
    ::baesline::baseline
    ::baseliens::baselines
    ::baseilnes::baselines
    ::baeslines::baselines
    ::becaues::because
    ::becasue::because
    ::becuase::because
    ::becauase::because
    ::becaseu::because
    ::beccause::because
    ::beacuse::because
    ::becuse::because
    ::becaue::because
    ::becuas::because
    ::becaus::because
    ::beocme::become
    ::beocmes::becomes
    ::becomse::becomes
    ::beofre::before
    ::befoer::before
    ::begni::begin
    ::begining::beginning
    ::begnis::begins
    ::behaivor::behavior
    ::behvaior::behavior
    ::behaior::behavior
    ::behaviro::behavior
    ::behaivors::behaviors
    ::behvaiors::behaviors
    ::behaiors::behaviors
    ::behaviros::behaviors
    ::bheind::behind
    ::behidn::behind
    :*:bleong::belong               ; belong/s/ed/ing/ings
    :*:belogn::belong
    ::bleow::below
    ::belwo::below
    :*:benhcmark::benchmark         ; benchmark/s/ed/ing
    :*:bnehcmark::benchmark
    :*:benchmakr::benchmark
    :*:bnechmark::benchmark
    ::benefist::benefits
    ::betwen::between
    ::beyodn::beyond
    ::billino::billion
    ::billinos::billions
    ::bniary::binary
    ::ibnary::binary
    ::binayr::binary
    ::lbock::block
    ::lbocks::blocks
    ::bolean::boolean
    ::boolena::boolean
    :C:boht::both
    :C:obth::both
    ::boundries::boundaries
    ::boudnaries::boundaries
    ::boundry::boundary
    ::boudnary::boundary
    :*:brnach::branch               ; branch/ed/es, branching, branchless
    :*:brachn::branch
    :*:brnahc::branch
    :*:breka::break                 ; break/s, breakpoint/s, breakthrough
    :*:brkea::break
    :*:braek;::break;               ; break/brake is ambiguous, but the semicolon implies the keyword
    :*:brak;::break;
    :*:berak;::break;
    ::breakpiotn::breakpoint
    ::breakpiotns::breakpoints
    ::breakthrouhg::breakthrough
    :*:braodcast::broadcast         ; broadcast/s/ed/ing/er
    ::borke::broke
    ::borken::broken
    ::broekn::broken
    ::brokne::broken
    ::borker::broker
    ::brokre::broker
    ::borkers::brokers
    ::brokres::brokers
    :*:borws::brows                 ; ex: brows/es/ed/er/ers/ing
    :*:brwos::brows
    ::buckte::bucket
    ::bucktes::buckets
    ::bulid::build
    ::biuld::build
    ::ubild::build
    ::buliding::building
    ::biulding::building
    ::ubilding::building
    ::bulids::builds
    ::biulds::builds
    ::ubilds::builds
    ::biult::built
    ::ubilt::built
    ::ubndle::bundle
    ::ubndles::bundles
    :C:BUt::But
    ::but nto::but not
    ::bytearay::bytearray           ; Python built-in type

    ::cahce::cache
    ::acche::cache
    ::acched::cached
    :*:calcualt::calculat           ; calculat/e/ed/es/or/ion
    :*:caluclat::calculat
    ::calucation::calculation
    ::calucations::calculations
    ::calender::calendar
    ::calenders::calendars
    :C:clal::call
    ::clalback::callback
    ::caleld::called
    ::claled::called
    ::claling::calling
    ::clals::calls
    :C:cna::can
    :C:Cna::Can
    :C:CAn::Can
    ::cant'::can't
    ::catn'::can't
    :*:cancle::cancel               ; cancel/s/ed/ing/ation
    ::cnadidate::candidate
    ::canddiate::candidate
    ::cnadidates::candidates
    ::canddiates::candidates
    ::canont::cannot
    ::cannto::cannot
    ::cannonical::canonical
    ::canoncial::canonical
    ::capcity::capacity
    ::capaicty::capacity
    ::cpacaity::capacity
    ::capcaity::capacity
    ::captrue::capture
    ::catpure::capture
    ::cpature::capture
    ::catpured::captured
    ::cpatured::captured
    ::captrues::captures
    ::catpures::captures
    ::cpatures::captures
    ::carog::cargo                  ; Rust package manager
    :C:caes::case                   ; switch-case
    :*:catagor::categor             ; category, categories, categorical
    :*:catgeor::categor
    ::cateogyr::category
    ::cateogry::category
    ::caues::cause
    ::casue::cause
    ::cuase::cause
    ::cauesd::caused
    ::casued::caused
    ::cuased::caused
    ::cauess::causes
    ::casues::causes
    ::cuases::causes
    ::cuation::caution
    ::cetner::center
    ::cetners::centers
    ::centrla::central
    ::certian::certain
    ::certianly::certainly
    ::cahining::chaining
    ::chaingn::chaining
    ::challegne::challenge
    ::challegning::challenging
    ::chagne::change
    ::cahnge::change
    ::chagen::change
    ::chagned::changed
    ::cahnged::changed
    ::chagend::changed
    ::chagnes::changes
    ::cahnges::changes
    ::chagens::changes
    ::chagning::changing
    ::cahnging::changing
    ::channle::channel
    ::channles::channels
    ::chatper::chapter
    ::chatpers::chapters
    :C:cahr::char
    :C:hcar::char
    ::chracter::character
    ::charcter::character
    ::charcater::character
    ::charater::character
    ::cahracter::character
    ::hcaracter::character
    ::characteres::characters
    ::chracters::characters
    ::charcters::characters
    ::charcaters::characters
    ::charaters::characters
    ::cahracters::characters
    ::hcaracters::characters
    ::cheaepr::cheaper
    ::chepaest::cheapest
    :*:chekc::check                 ; check/s/ed/er/ing/out/list/point
    :*:cehck::check
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
    ::chorme::chrome
    ::chrmoe::chrome
    ::cihper::cipher
    ::cihpertext::ciphertext
    ::circuti::circuit
    ::circutis::circuits
    ::ciruclar::circular
    ::clagn::clang
    ::clairfied::clarified
    ::clairfy::clarify
    ::clairfying::clarifying
    ::clss::class
    ::calss::class
    ::clasdef::classdef
    ::clsses::classes
    ::calsses::classes
    ::clasifier::classifier
    ::classifer::classifier
    ::calssifier::classifier
    ::clasifiers::classifiers
    ::classifers::classifiers
    ::calssifiers::classifiers
    ::caluse::clause
    ::cluase::clause
    ::caluses::clauses
    ::cluases::clauses
    ::clena::clean
    ::clenas::cleans
    ::cleasn::cleans
    ::clenaup::cleanup
    ::claer::clear
    :C:clera::clear
    ::clraed::cleared
    ::clerad::cleared
    ::claers::clears
    ::cleras::clears
    ::clickc::click
    ::clikc::click
    ::lcick::click
    ::lcicking::clicking
    ::clickcs::clicks
    ::clikcs::clicks
    ::lcicks::clicks
    ::clinet::client
    ::lcient::client
    ::lcinet::client
    ::clinetele::clientele
    ::lcientele::clientele
    ::lcinetele::clientele
    ::clinets::clients
    ::lcients::clients
    ::lcinets::clients
    ::clcok::clock
    ::lcock::clock
    ::clockc::clock
    ::clcoks::clocks
    ::lcocks::clocks
    ::clockcs::clocks
    ::cloen::clone
    ::cloens::clones
    ::clsoe::close
    ::clsoes::closes
    ::clsoure::closure
    ::closrue::closure
    ::clsoures::closures
    ::closrues::closures
    ::clodu::cloud
    :*:clutser::cluster             ; cluster/s/ed/ing
    :*:clsuter::cluster
    :C:COde::Code                   ; VS Code
    ::colleageus::colleagues
    :*:colelct::collect             ; collect/s/ing/ion/ions
    ::colide::collide
    ::colided::collided
    ::colides::collides
    ::colision::collision
    ::colisions::collisions
    :*:collumn::column              ; column/s/ar/ate/ise
    :*:ocmbin::combin               ; combin/e/ed/es/ation
    ::comibnation::combination
    ::combniation::combination
    ::comibnations::combinations
    ::combniations::combinations
    ::comibne::combine
    ::combnie::combine
    ::comibned::combined
    ::combnied::combined
    ::comibnes::combines
    ::combnies::combines
    ::comse::comes
    ::comand::command
    ::commnad::command
    ::commadn::command
    ::commmand::command
    ::comands::commands
    ::commnads::commands
    ::commadns::commands
    ::commmands::commands
    ::commetner::commenter
    ::commetners::commenters
    ::comit::commit
    ::comitment::commitment
    ::comitments::commitments
    ::comits::commits
    :*:commite::committe            ; ex: committe/d/r/rs/e/es
    ::comited::committed
    :*:comunicat::communicat        ; communicat/e/ed/es/ion
    ::companeis::companies
    ::comapnies::companies
    ::comapny::company
    ::compnay::company
    ::comapre::compare
    ::comprae::compare
    ::comarpe::compare
    ::comapred::compared
    ::compraed::compared
    ::comarped::compared
    ::comapres::compares
    ::comarpes::compares
    ::comparision::comparison
    ::compariosn::comparison
    ::compaison::comparison
    ::comparisions::comparisons
    ::compariosns::comparisons
    ::compaisons::comparisons
    ::compatabilities::compatibilities
    ::compatability::compatibility
    ::compatable::compatible
    ::compatibel::compatible
    ::competitve::competitive
    ::comiplation::compilation
    :*:comiple::compile             ; compile/r/d/s
    :*:compiel::compile
    ::comiler::compiler
    ::compliers::compilers
    ::compileres::compilers
    ::comilers::compilers
    :*:compelt::complet             ; complet/e/ed/es/ing/ion
    ::compelx::complex
    ::compelxity::complexity
    ::compleixty::complexity
    ::comlexity::complexity
    ::complexitiy::complexity
    ::complextiy::complexity
    ::complexiyt::complexity
    ::compleixyt::complexity
    ::comopnent::component
    ::componet::component
    ::compoent::component
    ::comonent::component
    ::componenet::component
    ::compoennt::component
    ::comopnents::components
    ::componets::components
    ::compoents::components
    ::comonents::components
    ::componenets::components
    ::compoennts::components
    ::compsoe::compose
    ::compsoes::composes
    ::composeite::composite
    ::compostie::composite
    ::comopsition::composition
    :*:compormis::compromis         ; compromis/e/ed/es/ing
    :*:comptua::computa             ; computa/ble/tion/tional/bility
    :*:comptue::compute             ; compute/r/s/d/rs
    :*:ocmpute::compute
    :*:cmopute::compute
    ::compuer::computer
    ::computre::computer
    ::compuers::computers
    :*:concatneate::concatenate     ; concatenate/d/r/s
    ::concetp::concept
    ::concpet::concept
    ::concetps::concepts
    ::conceptula::conceptual
    ::conceputal::conceptual
    :*:ocncurren::concurren         ; concurren/t/tly/cy
    :*:concuren::concurren
    ::concurrenet::concurrent
    :*:ocndition::condition         ; condition/s/ed/al/ing
    :*:condiion::condition
    :*:condtion::condition
    ::condiitonals::conditionals    ; singular form covered by a suffix rule
    ::conditoining::conditioning
    ::confidentality::confidentiality
    :*:ocnfig::config               ; config/ure/urable/uration
    :*:configru::configur           ; configur/e/ed/es/ing/ation
    :*:confilct::conflict           ; conflict/s/ed/ing
    :*:conenct::connect             ; connect/s/ed/ion/ing/ions/or
    :*:conect::connect
    :*:ocnnect::connect
    ::conseuctive::consecutive
    ::consectuive::consecutive
    ::concensus::consensus
    :*:consdier::consider           ; consider/s/ed/ably/ation
    ::considerd::considered
    :*:consitsen::consisten         ; consistent, consistency, consistently
    :*:conssiten::consisten
    :*:cosnisten::consisten
    ::consitency::consistency
    ::consitent::consistent
    ::consoel::console
    ::cosole::console
    ::consoe::console
    ::conosle::console
    :*:cosnt::const                 ; const, constant, constructor, constraint
    :*:conts::const
    :*:ocnst::const
    ::constexrp::constexpr          ; C++ keyword
    ::contexpr::constexpr
    ::constratin::constraint
    ::constraitn::constraint
    ::constriant::constraint
    ::constrait::constraint
    ::constratins::constraints
    ::constraitns::constraints
    ::constriants::constraints
    ::constraits::constraints
    :*:consturct::construct         ; construct/s/ed/or/ing
    ::constuctor::constructor
    ::consutl::consult
    ::consuem::consume
    ::consuemd::consumed
    ::consuemr::consumer
    ::consuemrs::consumers
    ::consuems::consumes
    :*:contian::contain             ; contain/s/er/ers/ing
    :*:contina::contain
    :*:ocntain::contain
    :*:ctonain::contain
    :*:contanier::container         ; container/s/ise/ized
    ::contaiing::containing
    ::cnotent::content
    ::contnet::content
    ::cnotents::contents
    ::contnets::contents
    :*:contets::contest             ; contest/s/ed/ant/ing
    :*:ocntext::context             ; context/s/ual/ually
    :*:conetxt::context
    :*:contniu::continu             ; continu/e/ous/ously/ally
    :*:conitnu::continu
    ::contineu::continue
    ::ocntinue::continue
    ::conintue::continue
    ::contiue::continue
    ::continuie::continue
    ::ocnitnue::continue
    ::continiue::continue
    ::contineue::continue
    ::contineud::continued
    ::ocntinued::continued
    ::conintued::continued
    ::contiued::continued
    ::continuied::continued
    ::ocnitnued::continued
    ::continiued::continued
    ::contineued::continued
    ::contineus::continues
    ::ocntinues::continues
    ::conintues::continues
    ::contiues::continues
    ::continuies::continues
    ::ocnitnues::continues
    ::continiues::continues
    ::contineues::continues
    ::contrayr::contrary
    :*:contirbut::contribut         ; contribute/d/s, contributor
    ::contribtue::contribute
    ::contriubte::contribute
    ::contriubtes::contributes
    :*:contorl::control             ; control/s/led/ler/ling
    :*:ocntrol::control
    ::convet::convert
    ::converet::convert
    ::convets::converts
    ::converets::converts
    ::convertes::converts
    ::cookei::cookie
    ::cookeis::cookies
    ::coordiante::coordinate
    ::coordiantes::coordinates
    ::copeid::copied
    ::copeis::copies
    ::cpoy::copy
    ::coyp::copy
    ::cpoyable::copyable
    ::coypable::copyable
    ::copyrgiht::copyright
    ::corenr::corner
    ::corenrs::corners
    :*:corect::correct              ; correct/ed/ion/tly/ness
    :*:corretc::correct
    :*:corresopnd::correspond       ; correspond/s/ed/ing
    :*:correspodn::correspond
    :*:corespond::correspond
    ::corresopnsd::corresponds
    ::coudl::could
    ::oculd::could
    ::could nto::could not
    ::coudln't::couldn't
    ::couldnt'::couldn't
    :*:coutn::count                 ; count/s/ed/er/ing, countVarName
    :*:ocunt::count
    ::cuople::couple
    ::covearge::coverage
    ::coveage::coverage
    :*:crahs::crash                 ; crash/es/ed/ing
    :*:carsh::crash
    ::crasehs::crashes
    ::crashse::crashes
    :*:cralw::crawl                 ; web crawl/s/ed/er/ing
    :*:carwl::crawl
    ::creat::create                 ; note: there exists a legacy C syscall called 'creat'
    ::creaete::create
    ::creaet::create
    ::craete::create
    ::creatd::created
    ::creaeted::created
    ::craeted::created
    ::creats::creates
    ::creaetes::creates
    ::craetes::creates
    ::craeting::creating
    ::craetion::creation
    ::criteira::criteria
    ::crtieria::criteria
    ::critiera::criteria
    ::ciritcal::critical
    ::criitcal::critical
    ::criticial::critical
    :*:crytpo::crypto               ; cryptography, cryptographic/ally
    :C:CTrl::Ctrl                   ; 'Control' keyboard modifier
    ::curent::current
    ::currenet::current
    ::currrent::current
    ::currnet::current
    ::currrently::currently
    ::curently::currently
    ::cusror::cursor
    ::cusrors::cursors
    :*:cusotm::custom               ; custom/er/ers/ary/ise
    ::custoemr::customer
    ::custoemrs::customers
    ::customie::customize
    ::customied::customized
    ::customies::customizes
    ::cycel::cycle
    ::cyceld::cycled
    ::cycels::cycles

    ::deamon::daemon                ; background process
    ::damaeg::damage
    ::dahsboard::dashboard
    :*:dadta::data                  ; data/set/sets/base
    ::dtaa::data
    :*:datda::data
    ::databse::database
    ::databaes::database
    ::datbase::database
    ::dadtbase::database
    ::databsae::database
    ::databses::databases
    ::datbases::databases
    ::dadtbases::databases
    ::databsaes::databases
    ::dataest::dataset
    ::dataests::datasets
    ::daedlock::deadlock
    ::daedlocks::deadlocks
    ::deallcoate::deallocate
    ::deallcoated::deallocated
    ::deallcoates::deallocates
    ::debuger::debugger
    ::debuging::debugging
    ::deicsion::decision
    ::deicsional::decisional
    ::deicsions::decisions
    ::declraed::declared
    ::decrase::decrease
    ::decrased::decreased
    ::decrases::decreases
    :*:decrment::decrement          ; decrement/s/ed
    ::deepcpoy::deepcopy
    :*:deafult::default             ; default/s/ed
    :*:defualt::default
    :*:defalut::default
    :*:dfeault::default
    :*:defauilt::default
    :*:defautl::default
    ::defien::define
    ::defiend::defined
    ::defiens::defines
    ::defintion::definition
    ::defintions::definitions
    :*:dleete::delete               ; delete/s/d/r
    ::deletd::deleted
    ::dleetion::deletion
    ::dleetions::deletions
    :*:deliimt::delimit             ; delimit/s/ed/er/ing
    ::dleivery::delivery
    ::dlievery::delivery
    ::detla::delta
    :*:dmeonstrat::demonstrat       ; demonstrat/e/s/ing/ion/ive
    :*:dpeend::depend               ; depends, dependency, dependence, dependencies
    :*:depenenc::dependenc
    ::dependnet::dependent
    ::dependnets::dependents
    :*:depht::depth                 ; depth, depthFirstSearch
    :*:detph::depth
    ::derefernce::dereference
    ::derefernced::dereferenced
    ::derefernces::dereferences
    ::dervie::derive
    ::dervied::derived
    ::dervies::derives
    ::descendnat::descendant
    ::descendnats::descendants
    ::descendnet::descendent
    ::descendnets::descendents
    ::descrbie::describe
    ::descirbe::describe
    ::descrbied::described
    ::descirbed::described
    ::descrbies::describes
    ::descirbes::describes
    ::desing::design
    ::deisgn::design
    ::deisng::design
    ::diesgn::design
    ::desinged::designed
    ::deisgned::designed
    ::deisnged::designed
    ::diesgned::designed
    ::desinging::designing
    ::deisgning::designing
    ::deisnging::designing
    ::diesgning::designing
    ::desings::designs
    ::deisgns::designs
    ::deisngs::designs
    ::diesgns::designs
    ::destiation::destination
    ::destiations::destinations
    :*:desturct::destruct           ; destruct/s/ed/or/ing/ive
    :*:detial::detail               ; detail/s/ed/er/ing
    :*:detemrin::determin           ; determin/e/ed/ant/ation/istic
    ::deteminant::determinant
    ::determien::determine
    ::determiend::determined
    ::determiens::determines
    ::determinsitic::deterministic
    ::determinstic::deterministic
    :*:devleop::develop             ; developer, development, developed
    :*:devloep::develop
    :*:dvelop::develop
    :*:develoep::develop
    :*:dveelop::develop
    ::developr::developer
    ::developrs::developers
    ::developeres::developers
    ::developesr::developers
    ::develoment::development
    ::developement::development
    ::devlopment::development
    ::devcie::device
    ::devcies::devices
    ::diagnoal::diagonal
    ::dialgo::dialog
    ::dialgos::dialogs
    ::dictinary::dictionary
    ::dictinoary::dictionary
    ::dictoinary::dictionary
    ::dictoniary::dictionary
    ::dicitonary::dictionary
    ::dictioary::dictionary
    ::did nto::did not
    ::din'dt::didn't
    ::dind't::didn't
    ::didnt'::didn't
    ::idff::diff
    ::diference::difference
    ::dfiference::difference
    ::differnce::difference
    ::diferences::differences
    ::dfiferences::differences
    ::differnces::differences
    ::diferent::different
    :*:differnet::different         ; different/ial/iable/iate
    :*:dfiferent::different
    :*:differnt::different
    :*:dififcult::difficult         ; difficult, difficulty, difficulties
    :*:difficutl::difficult
    :*:diffiuclt::difficult
    ::difficulyt::difficulty
    ::difficluty::difficulty
    ::digets::digest
    :*:diigt::digit                 ; digit/s/al/ally
    :*:dgiit::digit
    :*:idgit::digit
    ::digist::digits
    ::dimensinoal::dimensional
    ::dimensinoality::dimensionality
    :*:driect::direct               ; direct/s/ed/ly/ive/ion/ory
    :*:dierct::direct
    ::directd::directed
    ::diretories::directories
    ::directoires::directories
    ::direcotires::directories
    ::diretory::directory
    ::directoroy::directory
    ::diable::disable
    ::diabled::disabled
    ::diables::disables
    ::disadvnatage::disadvantage
    ::disadvnatages::disadvantages
    :*:disconenct::disconnect       ; disconnect/ed/ion/ing/ions/or
    :*:disconect::disconnect
    :*:disocver::discover           ; discover/s/y/ed/ing
    ::dispaly::display
    ::idsplay::display
    ::idsplayed::displayed
    ::dispalying::displaying
    ::idsplaying::displaying
    ::dispalys::displays
    ::idsplays::displays
    :*:distni::distin               ; distinct/ion, distinguish/ing/ability
    :*:distirbut::distribut         ; distribut/e/ed/er/ion/ing
    :*:dsitribut::distribut
    ::distribtue::distribute
    ::distriuted::distributed
    ::distribued::distributed
    ::distriubtion::distribution
    ::distriubtions::distributions
    ::od not::do not
    ::do nto::do not
    :*:docment::document            ; document/s/ed/ing/ation
    :*:odcument::document
    :*:doucment::document
    :*:documentn::document
    :*:documnt::document
    :*:docuemnt::document
    ::documentd::documented
    ::doesn ot::does not
    ::doe snot::does not
    ::doesnot::does not
    ::does nto::does not
    ::doesnt'::doesn't
    ::doens't::doesn't
    ::doenst::doesn't
    ::doen'st::doesn't
    ::dosen't::doesn't
    ::odesn't::doesn't
    ::odens't::doesn't
    ::does'nt::doesn't
    ::doe'snt::doesn't
    ::done'st::doesn't
    ::dont'::don't
    ::dno't::don't
    ::doubel::double
    ::duoble::double
    ::doulbe::double
    ::doubeld::doubled
    ::duobled::doubled
    ::doulbed::doubled
    ::doubels::doubles
    ::duobles::doubles
    ::doulbes::doubles
    :*:donwload::download           ; download/s/ed/er/ing
    :*:downloda::download
    :*:donwlaod::download
    ::downsream::downstream
    ::donwstream::downstream
    ::darw::draw
    ::darwing::drawing
    :*:drvie::drive                 ; drive/n/r/rs/s
    ::dupm::dump
    ::dupmed::dumped
    ::dupms::dumps
    :*:duplcat::duplicat            ; duplicat/e/ed/es/ing/ion
    :*:dpulicat::duplicat
    ::duplciate::duplicate
    ::duplicat::duplicate
    ::dupcliate::duplicate
    ::duplciated::duplicated
    ::duplicatd::duplicated
    ::dupcliated::duplicated
    ::duplciates::duplicates
    ::duplicats::duplicates
    ::dupcliates::duplicates
    ::duplciation::duplication
    :*:dyanm::dynam                 ; dynam/ic/ics/ic_cast/oDB

    ::eahc::each
    ::easeir::easier
    ::eaisly::easily
    ::edidt::edit
    ::eidt::edit
    ::edidted::edited
    ::eidted::edited
    ::eidtor::editor
    ::ediotr::editor
    ::editro::editor
    ::edtior::editor
    ::edidtor::editor
    ::eidtors::editors
    ::ediotrs::editors
    ::editros::editors
    ::edidtors::editors
    ::edtiors::editors
    ::edidts::edits
    ::eidts::edits
    ::efficeincy::efficiency
    ::eficient::efficient
    ::efficent::efficient
    :*:eigne::eigen                 ; eigen/space/value/vector
    ::iether::either
    :*:elsatic::elastic             ; elastic/ically/search
    :*:elstaic::elastic
    ::electornic::electronic
    ::electornics::electronics
    :*:elemtn::element              ; element/s/al/ary
    :*:elemnt::element
    :*:elmeent::element
    :*:elmeetn::element
    :*:elment::element
    :*:eleemnt::element
    :*:leement::element
    :*:elemten::element
    ::elipse::ellipse
    ::ellitpic::elliptic            ; elliptic curve
    ::eliptic::elliptic
    :C:esle::else
    ::elsei f::else if
    ::esel if::else if
    ::esleif::elseif
    ::eselif::elseif
    ::emailng::emailing
    ::emaling::emailing
    ::embeded::embedded
    ::emision::emission
    ::emisions::emissions
    ::emited::emitted
    ::emiting::emitting
    ::employesr::employers
    ::emtpied::emptied
    ::emtpy::empty
    ::empyt::empty
    ::emty::empty
    ::emualte::emulate
    ::emualted::emulated
    ::emualtes::emulates
    ::enbale::enable
    ::enbaled::enabled
    ::enbales::enables
    ::encapuslation::encapsulation
    :*:encoutner::encounter         ; encounter/s/ed/ing
    :C:ENd::End                     ; common Visual Basic keyword
    :C:enld::endl                   ; C++ newline (endline)
    ::engaeg::engage
    ::egnine::engine
    ::enginer::engineer
    ::egnineer::engineer
    ::enginers::engineers
    ::egnineers::engineers
    :*:enahnce::enhance             ; enhance/d/s/ment/ments
    :*:enhacne::enhance
    ::enhancment::enhancement
    ::enhancments::enhancements
    ::enoguh::enough
    ::enuogh::enough
    ::ensrue::ensure
    ::ensrues::ensures
    ::ensruing::ensuring
    :*:ential::entail               ; ential/s/ed/ing/ment
    ::etnire::entire
    ::entites::entities
    ::enttiy::entity
    ::entiyt::entity
    ::enitty::entity
    ::etnity::entity
    ::entroyp::entropy
    ::enumeate::enumerate
    ::enumeated::enumerated
    ::enumeates::enumerates
    :*:envrion::environ             ; environ/ment/ments/mental
    :*:enviorn::environ
    :*:envirno::environ
    :*:enviroment::environment      ; environment/s/al
    :*:euqal::equal                 ; equal/s/ed/ly/ing/ity
    :*:equla::equal
    :*:euqla::equal
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
    ::eraess::erases
    ::errror::error
    ::errrors::errors
    :*:establihs::establish         ; establish/es/ed/ing
    :*:estalbish::establish
    :*:esitmat::estimat             ; estimat/e/ed/es/ing/ion
    ::estimiation::estimation
    :*:evlauat::evaluat             ; evaluate/d/s, evaluati/ng/on
    :*:evaulat::evaluat
    ::evalution::evaluation
    :C:evne::even
    ::evenet::event
    ::evnet::event
    ::evenets::events
    ::eventes::events
    ::evnets::events
    ::eventula::eventual
    ::evenutal::eventual
    ::evnetual::eventual
    ::evenutally::eventually
    ::evnetually::eventually
    ::evvery::every
    ::eveyrone::everyone
    ::everyting::everything
    ::everytyhing::everything
    ::everthing::everything
    ::evertyhing::everything
    ::everywehre::everywhere
    ::everywheer::everywhere
    :*:exatc::exact                 ; exact/s/ed/ly/ing
    ::examien::examine
    ::examiend::examined
    ::examiens::examines
    ::eample::example
    ::examle::example
    ::exaple::example
    ::exmaple::example
    ::exampel::example
    ::exam]le::example
    ::eamples::examples
    ::examles::examples
    ::exaples::examples
    ::exmaples::examples
    ::exampels::examples
    ::exam]les::examples
    :*:excpet::except               ; except/s/ed/ion/ions
    :*:excetp::except
    :*:excepet::except
    ::excahnge::exchange
    ::exchagne::exchange
    ::excahnged::exchanged
    ::exchagned::exchanged
    ::excahnges::exchanges
    ::exchagnes::exchanges
    ::exclsuive::exclusive
    :*:exeuct::execut               ; execut/e/ing/ion/able
    :*:execuct::execut
    ::exectable::executable
    ::exectuable::executable
    ::exectables::executables
    ::exectuables::executables
    ::exectue::execute
    ::exectuer::executer            ; exception for '-tuer' -> '-ture'
    ::exectuers::executers
    ::exeution::execution
    ::execuion::execution
    ::exemtp::exempt
    ::exhausive::exhaustive
    ::existance::existence
    ::exapnd::expand
    ::exapnded::expanded
    ::exapnds::expands
    ::expanison::expansion
    ::expectd::expected
    :*:exepri::experi               ; experience/s/d, experiment/s/ed/ation
    :*:expeir::experi
    ::expereinced::experienced
    ::exipry::expiry
    :*:expalin::explain             ; explain/s/ed/ing
    :*:explian::explain
    :*:explina::explain
    ::explcit::explicit
    ::explclit::explicit
    ::explcitly::explicitly
    ::explclitly::explicitly
    ::explroer::explorer
    ::exopential::exponential
    ::expoentnial::exponential
    ::expoential::exponential
    ::expoenntial::exponential
    ::expoenential::exponential
    ::exponenetial::exponential
    ::expoenentiation::exponentiation
    :*:exoprt::export               ; export/ed/er/s
    ::expor::export
    ::expresison::expression
    ::expresion::expression
    ::exprssion::expression
    ::expreession::expression
    ::expresisons::expressions
    ::expresions::expressions
    ::exprssions::expressions
    ::expreessions::expressions
    :*:extedn::extend               ; extend/s/ed/er/ing
    :*:exetnd::extend
    :*:etxend::extend
    ::extnesion::extension
    ::extenison::extension
    ::etxension::extension
    ::extnesions::extensions
    ::extenisons::extensions
    ::etxensions::extensions
    ::externla::external
    ::extenral::external
    ::exteranl::external
    ::extenrla::external
    ::externlas::externals
    ::extenrals::externals
    ::exteranls::externals
    ::extenrlas::externals
    :*:extrapoalte::extrapolate     ; extrapolate/d/s

    :*:facotr::factor               ; factor/s/y/ed/ies
    ::faield::failed
    ::fials::fails
    ::failrue::failure
    ::fialure::failure
    ::fialrue::failure
    ::fairue::failure
    ::afilure::failure
    ::failrues::failures
    ::fialures::failures
    ::fialrues::failures
    ::fairues::failures
    ::afilures::failures
    ::fiarly::fairly
    ::fkae::fake
    ::fkaed::faked
    ::fallthrouhg::fallthrough
    ::flase::false
    ::aflse::false
    :C:fales::false                 ; case-sensitive to preserve 'Fales' surname
    ::fasle::false
    :C:FAlse::False
    :*:fasel;::false;
    ::familar::familiar
    ::fatser::faster
    ::fautl::fault
    ::favoriet::favorite
    ::favoirte::favorite
    ::favortie::favorite
    ::favoriets::favorites
    ::favoirtes::favorites
    ::favorties::favorites
    :*:feasab::feasib               ; feasible, feasibly, feasibility
    :*:faeture::feature             ; feature/d/s
    :*:fetaure::feature
    ::fethc::fetch
    ::fecth::fetch
    ::fecthed::fetched
    ::fecthes::fetches
    ::fibonnaci::fibonacci          ; fibonacci sequence, fibonacci heap
    ::fiedl::field
    ::fiedls::fields
    ::ifle::file
    ::fiels::files
    ::ifles::files
    ::fielsystem::filesystem
    ::iflesystem::filesystem
    ::filesytem::filesystem
    ::filesytsem::filesystem
    ::ifnal::final
    ::finaly::finally
    ::finaincial::financial
    ::fidn::find
    :C:FInd::Find
    :C:ifnd::find
    :C:fnid::find
    ::ifnding::finding
    ::fniding::finding
    ::fidns::finds
    ::ifnds::finds
    ::fnids::finds
    ::fireofx::firefox
    ::fisrt::first
    ::firsrt::first
    ::ifrst::first
    ::flahs::flash
    ::flahses::flashes
    ::flaot::float
    ::flaoting::floating            ; floating-point
    ::flaots::floats
    ::flwo::flow
    ::flwoed::flowed
    ::flwos::flows
    :*:ofcus::focus                 ; focus/es/ed/ing
    ::focuesd::focused
    ::fodler::folder
    ::fodlers::folders
    ::fodling::folding
    :*:folow::follow                ; follow/s/ed/er/ing
    :*:follwo::follow
    :C:ofr::for                     ; 'for' keyword
    :C:FOr::For
    :*:fo r(::for (                 ; 'for' loop
    ::fo rthe::for the
    ::fort he::for the
    ::fo rteh::for the
    ::for th::for the
    ::fo rhte::for the
    ::fro the::for the
    ::foreeach::foreach             ; Perl keyword
    ::foregorund::foreground
    ::foregournd::foreground
    ::foriegn::foreign
    ::froeign::foreign              ; exception for correcting '-ign' to '-ing'
    ::foreing::foreign
    :*:ofrmat::format               ; format/s/ed/ting
    :*:foramt::format
    ::formating::formatting
    ::froms::forms
    :*:formualte::formulate         ; formulate/d/s
    :C:forSOme::forSome             ; Scala keyword
    ::forwared::forward
    ::forwrad::forward
    ::forwrading::forwarding
    ::forwareds::forwards
    ::forwrads::forwards
    :*:foudn::found                 ; found/ation/ational
    ::founation::foundation
    ::fpritnf::fprintf              ; common file formatting function
    :*:framgent::fragment           ; fragment/s/ed/ing/ation
    ::frmae::frame
    ::famre::frame
    ::frmaed::framed
    ::famred::framed
    ::frmaes::frames
    ::famres::frames
    ::frmaework::framework
    :*:freuqen::frequen             ; frequen/t/cy/tly
    :*:frquen::frequen
    :*:frueqen::frequen
    ::freuent::frequent
    ::freuently::frequently
    ::firend::friend
    ::freind::friend
    ::firends::friends
    ::freinds::friends
    :C:FRom::From
    ::frmo::from
    ::fro mthe::from the
    ::fornt::front
    ::frotn::front
    ::forntier::frontier
    ::frotnier::frontier
    ::forzenset::frozenset
    :C:fucn::func                   ; Go function keyword
    :*:fucntion::function           ; function/s/al/ality/alities
    :*:funtion::function
    :*:fnction::function
    :*:fucniton::function
    :*:fucntino::function
    :*:fucntoin::function
    :*:fucniotn::function
    :*:funtcion::function
    :*:fuction::function
    :*:fuctnion::function
    ::functioal::functional
    ::functoining::functioning
    ::funadmental::fundamental
    ::fudnamental::fundamental
    ::funadmentals::fundamentals
    ::fudnamentals::fundamentals
    ::fudns::funds

    ::gatewya::gateway
    ::gatewyas::gateways
    ::guage::gauge
    ::guaged::gauged
    ::guages::gauges
    ::gausian::gaussian
    ::guassian::gaussian
    ::guasian::gaussian
    ::genereally::generally
    :*:geneart::generat             ; generat/e/s/or/ing/ion
    :*:geneate::generate
    ::geneating::generating
    ::geospaital::geospatial
    ::githbu::github
    ::gvie::give
    ::gvien::given
    ::givne::given
    :*:glithc::glitch               ; glitch/ed/es/ing
    ::glboal::global
    ::glboally::globally
    ::glboals::globals
    :C:go ot::go to
    ::goe sto::goes to
    ::oging::going
    ::going ot::going to
    :C:goot::goto
    ::gradiet::gradient
    ::gradaul::gradual
    :C:grammer::grammar             ; case sensitive to preserve 'Grammer' surname
    ::gratner::granter
    ::gratners::granters
    :*:grpah::graph                 ; graph/s/ing/ics
    :*:grahp::graph
    :*:garph::graph
    ::gerat::great
    ::gretaer::greater
    ::gredy::greedy
    ::gridn::grind
    ::gridns::grinds
    ::gorund::ground
    ::gournd::ground
    ::gorunds::grounds
    ::gournds::grounds
    :*:gropu::group                 ; group/s/ed/ing
    :C:gorup::group                 ; whitelist 'Gorup' surname
    ::goruped::grouped
    ::grouepd::grouped
    ::goruping::grouping
    ::gorups::groups

    ::hlaf::half
    ::hadnle::handle
    ::hadnler::handler
    ::handelr::handler
    ::hadnlers::handlers
    ::handelrs::handlers
    ::hadnles::handles
    ::hadnling::handling
    ::hapen::happen
    ::hapened::happened
    ::hapepned::happened
    ::hapepend::happened
    ::hapening::happening
    ::hapepning::happening
    ::hapens::happens
    ::harenss::harness              ; test harness
    :C:hsa::has
    :C:Hsa::Has
    :C:HAs::Has
    :*:hahs::hash                   ; hash/es/ed/ing/map/table
    ::hasnt'::hasn't
    ::has'nt::hasn't
    ::hans't::hasn't
    ::hvae::have
    ::ahve::have
    ::haev::have
    :C:HAve::Have
    ::have nto::have not
    :C:have ot::have to
    ::have'nt::haven't
    ::havn'et::haven't
    ::havne't::haven't
    ::ahven't::haven't
    ::hvaen't::haven't
    ::haevn't::haven't
    ::haven'et::haven't
    ::havent'::haven't
    ::helath::health
    ::heatlh::health
    ::helathy::healthy
    ::heatlhy::healthy
    ::hieght::height
    ::hieghts::heights
    ::heruistic::heuristic
    ::heruistics::heuristics
    ::hiddne::hidden
    ::heirarchy::hierarchy
    ::hierarhcy::hierarchy
    ::hihg::high
    ::hihger::higher
    ::hgiher::higher
    ::hightest::highest
    ::hihgest::highest
    ::highets::highest
    ::hgihest::highest
    ::hodler::holder
    ::hodlers::holders
    :C:hoem::home
    :C:hsot::host
    ::hsots::hosts
    :C:horus::hours
    :C:HOw::How
    ::howthe::how the
    ::howto::how to
    :C:how ot::how to
    ::hwo to::how to
    ::howver::however
    ::hoewver::however
    ::humna::human
    ::humnas::humans
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

    ::i"d::i'd
    ::i"ll::i'll
    ::i"m::i'm
    ::i"ve::i've
    ::i'ev::i've
    ::i"ev::i've
    :C:idae::idea
    ::idaes::ideas
    :*:idemopten::idempoten         ; idempoten/t/ce/cy
    :*:idmepoten::idempoten
    :*:idnetif::identif             ; identif/y/ies/iable/ication
    ::idenetifier::identifier
    ::identtiy::identity
    ::identiyt::identity
    ::idenitty::identity
    ::idenetity::identity
    ::idnetity::identity
    ::fi it::if it
    ::fi that::if that
    ::fi the::if the
    :C:IF the::If the
    ::fi these::if these
    ::fi they::if they
    ::fi this::if this
    ::fi those::if those
    ::fi you::if you
    :*:igonr::ignor                 ; ignor/e/es/ed/ing
    ::illegla::illegal
    ::iamge::image
    ::imaeg::image
    ::iamges::images
    ::imblaance::imbalance
    ::imblaanced::imbalanced
    ::immeidate::immediate
    ::immeidately::immediately
    ::immutabel::immutable
    ::imutable::immutable
    :*:imapct::impact               ; impact/s/ed/ful
    ::impereative::imperative
    :*:implmenet::implement         ; implement/s/ation/ations
    :*:implmeent::implement
    :*:impelement::implement
    :*:impelment::implement
    ::implemenation::implementation
    ::implemeentation::implementation
    ::implemenations::implementations
    ::implemeentations::implementations
    ::implciit::implicit
    ::implcit::implicit
    ::implclit::implicit
    ::implciitly::implicitly
    ::implcitly::implicitly
    ::implclitly::implicitly
    :*:imoprt::import               ; import/s/ed/er/ant
    :*:imorpt::import
    ::impot::import
    ::imporant::important
    ::impots::imports
    ::imposible::impossible
    ::imposisble::impossible
    ::imprvoement::improvement
    ::imprvoements::improvements
    ::i na::in a
    ::i nan::in an
    ::i nrange::in range            ; Python loop
    ::inthe::in the
    ::in th::in the
    ::i nthe::in the
    ::incednet::incedent
    ::incednets::incedents
    ::incldue::include
    ::incdlue::include
    ::inculde::include
    ::includ::include
    ::inclue::include
    ::incldued::included
    ::incdlued::included
    ::inculded::included
    ::incldues::includes
    ::incdlues::includes
    ::inculdes::includes
    ::inclues::includes
    ::inclsive::inclusive
    ::inclsuive::inclusive
    ::incrase::increase
    ::incrased::increased
    ::incrases::increases
    :*:icnrement::increment         ; increment/s/al/ed/ing
    :*:incrment::increment
    ::indnet::indent
    ::indnets::indents
    ::indpeendent::independent
    ::independant::independent
    ::independnet::independent
    ::indpeendently::independently
    ::independantly::independently
    :*:idnex::index                 ; index/ed/es/ing
    :*:indeex::index
    :*:nidex::index
    :*:inidcat::indicat             ; indicat/e/es/or/ion
    :*:idnicat::indicat
    :*:indistnig::indisting         ; indistinguishable, indistinguishability
    ::individaul::individual
    ::ineficient::inefficient
    ::ineequality::inequality
    :*:infeasab::infeasib           ; infeasible, infeasibility
    ::inifnity::infinity
    :C:inof::info
    :C:ifno::info
    :*:infomr::inform               ; inform/s/ed/ation/ative
    :*:inofrmati::informati         ; informati/on/ve/cs/onal
    :*:ifnormati::informati
    ::infrasturcture::infrastructure
    :*:infreuqen::infrequen         ; infrequen/t/tly
    :*:infrquen::infrequen
    :*:inherti::inherit             ; inherit/s/ed/ance
    :*:inhreit::inherit
    :*:inehrit::inherit
    :*:inehrti::inherit
    :*:intiial::initial             ; initial, initialize/d, initialization
    :*:inital::initial
    ::initaited::initiated
    :*:inejct::inject               ; inject/s/ed/ion
    ::inupt::input
    ::inptu::input
    ::intput::input
    ::inupts::inputs
    ::inptus::inputs
    ::intputs::inputs
    :*:isnert::insert               ; insert/s/ed/er/ion
    :*:insret::insert
    :*:inserrt::insert
    :*:inesrt::insert
    :*:inerst::insert
    :*:isnta::insta                 ; instance, install, instantiate
    ::intall::install
    ::intance::instance
    ::intances::instances
    ::instantaited::instantiated
    ::isntead::instead
    ::intsead::instead
    ::intead::instead
    ::instad::instead
    ::insetad::instead
    ::isnetad::instead
    ::insteado f::instead of
    ::isnteadof::insteadof          ; PHP
    :*:isntr::instr                 ; instruction/s, instrument/s
    ::insruction::instruction
    ::insructions::instructions
    :C:itn::int                     ; integer data type
    :*:itneg::integ                 ; integ/er/rity/ral/ration
    ::intger::integer
    ::integeres::integers
    ::intgers::integers
    :*:integerat::integrat          ; integrat/ed/es/ion
    ::integriy::integrity
    ::integirty::integrity
    :*:intelig::intellig            ; intellig/ent/ence/ible
    :*:itner::inter                 ; interface, internal, interact, interval
    ::intercetp::intercept
    ::intercetps::intercepts
    ::intersting::interesting
    ::interafce::interface
    ::inteface::interface
    ::interafces::interfaces
    ::intefaces::interfaces
    ::internla::internal
    ::intenral::internal
    ::interanl::internal
    ::intenrla::internal
    ::internlas::internals
    ::intenrals::internals
    ::interanls::internals
    ::intenrlas::internals
    ::interopeate::interoperate
    :*:intepr::interp               ; interpolat/e/ion, interpret/s/ation
    :*:interopl::interpol           ; interpol/ate/ated/ates/ating
    :*:interperet::interpret        ; interpret/s/ed/er
    ::interpeter::interpreter
    :*:interupt::interrupt          ; interrupt/s/ed/er/ing/ion
    ::interavl::interval
    ::intervla::interval
    ::intreval::interval
    ::interavls::intervals
    ::intervlas::intervals
    ::intrevals::intervals
    :C:inot::into
    :C:itno::into
    ::intractible::intractable
    :*:itnro::intro                 ; intro/duce/duction/spect
    :*:intorduc::introduc           ; introduc/e/d/s/tion
    :*:introuce::introduce          ; introduce/s/d
    :*:introudce::introduce
    ::intutive::intuitive
    ::intuivie::intuitive
    ::intutively::intuitively
    ::intuiviely::intuitively
    ::invlaid::invalid
    ::ivnalid::invalid
    ::invariatn::invariant
    ::ivnariant::invariant
    ::invariatns::invariants
    ::ivnariants::invariants
    :*:invnet::invent               ; invent/ed/ing/ory
    ::invesre::inverse
    ::invertable::invertible
    :*:invovl::involv               ; involv/e/ed/es/ement/ing
    :*:inovlv::involv
    ::iosream::iostream             ; C++ I/O header
    ::iosteam::iostream
    ::isotream::iostream
    ::is nto::is not
    ::isthe::is the
    ::i sthe::is the
    :C:is ot::is to
    :C:si to::is to
    ::isintance::isinstance         ; Python function
    ::ins't::isn't
    ::isnt'::isn't
    ::sin't::isn't
    ::is'nt::isn't
    ::isseu::issue
    ::isseud::issued
    ::isseus::issues
    :C:ti is::it is
    :C:iti s::it is
    ::it ot::it to
    ::i'ts::it's
    ::iteate::iterate
    ::iteates::iterates
    ::iteraeting::iterating
    ::itereating::iterating
    ::iteation::iteration
    ::itereation::iteration
    ::iteraion::iteration
    ::iteraetion::iteration
    ::iteations::iterations
    ::itereations::iterations
    ::iteraions::iterations
    ::iteraetions::iterations
    ::itereator::iterator
    ::iteator::iterator
    ::itereators::iterators
    ::iteators::iterators
    ::istelf::itself

    :C:JAva::Java
    :C:javascritp::javascript       ; with 2 capital letters, this word does not fit AHK's traditional model
    :C:JavaScritp::JavaScript       ; therefore, it needs twice the rules
    :C:jaascript::javascript
    :C:JaaScript::JavaScript
    :C:javacript::javascript
    :C:Javacript::JavaScript
    :C:javasript::javascript
    :C:JavaSript::JavaScript
    :C:JAvaScript::JavaScript
    :C:JavaSCript::JavaScript
    ::jbos::jobs
    :C:jion::join
    ::jioned::joined
    ::jioning::joining
    ::jions::joins
    ::joisn::joins                  ; oisn => sion exception
    ::jorunal::journal
    ::jounral::journal
    ::journla::journal
    ::jouranl::journal
    ::jorunals::journals
    ::jounrals::journals
    ::journlas::journals
    ::jouranls::journals
    ::jqueyr::jquery
    ::jqeury::jquery
    ::jqurey::jquery
    ::jthraed::jthread              ; C++ joining thread
    ::jsut::just

    ::keywrod::keyword
    ::keyowrd::keyword
    ::keywrods::keywords
    ::keyowrds::keywords
    ::kidn::kind
    ::kidns::kinds
    :*:knwo::know                   ; ex: know/s/n/ing/ledge
    :*:konw::know
    :*:nkow::know
    ::knowlege::knowledge
    ::knowlegeable::knowledgeable
    ::kotiln::kotlin
    ::kubernets::kubernetes

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
    ::languae::language
    ::langauges::languages
    ::langagues::languages
    ::lnaguages::languages
    ::lagnuages::languages
    ::lnagauges::languages
    ::lanaguages::languages
    ::languaes::languages
    ::lapotp::laptop
    ::alrge::large
    ::alrger::larger
    ::largets::largest
    ::alrgest::largest
    ::laetncy::latency
    ::altency::latency
    :*:lauchn::launch               ; launch/es/ed/ing
    :*:laucnh::launch
    ::layotu::layout
    ::layotus::layouts
    ::leadre::leader
    ::laeder::leader
    ::laeders::leaders
    :*:leran::learn                 ; learn/s/ed/ing
    :*:laern::learn
    :*:lerna::learn
    ::leanr::learn
    ::leanring::learning
    ::lesat::least
    ::elft::left                    ; binary tree left/right
    ::legla::legal
    ::legnth::length
    ::lenght::length
    ::lnegth::length
    ::legnths::lengths
    ::lenghts::lengths
    ::lnegths::lengths
    ::leter::letter
    ::lettter::letter
    ::leters::letters
    ::lettters::letters
    ::levle::level
    ::levles::levels
    ::liaiason::liaison
    ::laison::liaison
    ::laiason::liaison
    ::lbiraries::libraries
    ::libraires::libraries
    ::librarry::library
    ::lbirary::library
    ::librayr::library
    ::liek::like
    ::liekly::likely
    ::lieks::likes
    :*:liimt::limit                 ; limit/s/ed/er/ing/ation
    ::limittation::limitation
    ::limittations::limitations
    ::limting::limiting
    :C:ilne::line
    ::lienar::linear
    ::linera::linear
    ::ilnear::linear
    ::linaer::linear
    ::lienarly::linearly
    ::lineraly::linearly
    ::ilnearly::linearly
    ::linaerly::linearly
    ::ilnes::lines
    :C:likn::link
    ::linkaeg::linkage
    ::liknage::linkage
    ::linekd::linked
    ::likned::linked
    ::linekr::linker
    ::likner::linker
    ::litner::linter
    ::litners::linters
    :C:LInux::Linux
    ::lniux::linux
    ::lsit::list
    ::ilst::list
    ::lsited::listed
    ::ilsted::listed
    :*:lsiten::listen               ; listen/s/er/ers/ing
    :*:ilsten::listen
    :*:lisetn::listen
    ::listenr::listener
    ::listenrs::listeners
    ::lsiting::listing
    ::ilsting::listing
    ::lsitings::listings
    ::ilstings::listings
    ::lsits::lists
    ::ilsts::lists
    ::lvie::live
    ::lcoal::local                  ; Lua keyword
    :*:lcoali::locali               ; locali/se/ze/ty/zation
    ::lcoation::location
    ::lcoations::locations
    ::lokc::lock
    ::logairthm::logarithm
    ::lgoical::logical
    ::loign::login
    ::lnog::long
    ::logner::longer
    ::lnoger::longer
    ::longets::longest
    ::lognest::longest
    ::lnogest::longest
    :*:looop::loop                  ; loop/s/ed/ing
    ::lsot::lost
    ::lwoer::lower
    ::lwoercase::lowercase
    ::loweset::lowest
    ::lwoest::lowest

    ::mahcine::machine
    ::machien::machine
    ::macine::machine
    ::macihne::machine
    ::machins::machines
    ::mahcines::machines
    ::machiens::machines
    ::macines::machines
    ::macihnes::machines
    ::macintohs::macintosh
    :*:maintian::maintain           ; maintain/s/ed/ing
    :*:maintina::maintain
    ::mjaor::major
    ::mkae::make
    ::maek::make
    :C:amke::make
    ::makefiel::makefile
    ::maeks::makes
    ::amkes::makes
    ::mkaing::making
    ::maloc::malloc
    :*:manaeg::manage               ; manage/r/d/rs/ment/eable
    :*:mangae::manage
    :*:maange::manage
    :*:manfactur::manufactur        ; manufactur/ed/er/ing
    ::mnay::many
    ::maping::mapping
    ::mapings::mappings
    ::marign::margin
    ::marigns::margins
    ::matser::master
    :*:mtach::match                 ; match/ed/es/ing
    :*:amtch::match
    ::matcing::matching
    ::mathamatical::mathematical
    ::mathmatical::mathematical
    ::mathamatics::mathematics
    ::mathmatics::mathematics
    ::maltab::matlab
    ::mtalab::matlab
    ::amtrix::matrix
    ::maxinum::maximum
    ::maximm::maximum
    ::menas::means
    ::measn::means
    ::menat::meant
    ::measureable::measurable
    ::measrue::measure
    ::measrues::measures
    ::mechnaism::mechanism
    ::mechnaisms::mechanisms
    ::membesr::members
    ::memoiation::memoization
    :*:memrois::memoris
    :*:memroiz::memoriz             ; memoriz/e/ed/ation
    ::memroy::memory
    ::memoroy::memory
    ::mmeory::memory
    ::mentoining::mentioning
    ::mrege::merge
    ::emrge::merge
    ::mreged::merged
    ::emrged::merged
    ::mreges::merges
    ::emrges::merges
    :*:messsag::messag              ; messag/e/s/ed/ing
    ::mesage::message
    ::messgae::message
    ::messgaed::messaged
    ::mesages::messages
    ::messageing::messaging
    ::emtadata::metadata
    ::metadadta::metadata
    ::metadat::metadata
    ::metadta::metadata
    ::meatdata::metadata
    ::microsfot::microsoft
    ::millino::million
    ::millinos::millions
    ::minmal::minimal
    ::mnimize::minimize
    ::mininum::minimum
    ::minmum::minimum
    ::minimm::minimum
    ::minutse::minutes
    ::mismtach::mismatch
    ::misraed::misread
    ::mispell::misspell
    ::mistakse::mistakes
    ::mdoe::mode
    ::modle::model
    ::mdoel::model
    :C:modling::modeling
    ::modles::models
    ::mdoels::models
    ::moderatly::moderately
    ::mdoes::modes
    :*:mdoif::modif                 ; modif/y/ied/ies/ication
    ::modifcation::modification
    ::modifcations::modifications
    ::omdular::modular
    ::modurla::modular
    ::moduel::module
    ::modlue::module
    ::omdule::module
    ::moduels::modules
    ::modlues::modules
    ::omdules::modules
    :*:monitro::monitor             ; monitor/s/ed/ing
    ::mroe::more
    ::omre::more
    ::msot::most
    ::motoining::motioning
    ::mosue::mouse
    ::mvoe::move
    ::mvoed::moved
    ::mvoes::moves
    ::muhc::much
    :*:mlti::multi                  ; multi/threaded/plex/process/tasking/ply
    :*:mjulti::multi
    :*:mulitp::multip
    :*:mulipt::multip
    ::multipel::multiple
    ::multipels::multiples
    ::multipleid::multiplied
    ::multipleir::multiplier
    ::multply::multiply
    ::multiproceessing::multiprocessing
    ::multiporcessing::multiprocessing
    ::multithraed::multithread
    ::msut::must
    ::must nto::must not
    ::mutabel::mutable
    ::mtuex::mutex
    ::mtuexes::mutexes
    ::mutula::mutual

    ::nmae::name
    ::nmaed::named
    ::namelsit::namelist            ; FORTRAN statement
    ::nmaes::names
    ::namespce::namespace
    ::nmaespace::namespace
    ::namepace::namespace
    ::naturla::natural
    :C:naer::near
    ::naerby::nearby
    ::neraby::nearby
    ::nearyb::nearby
    ::naerly::nearly
    ::nealry::nearly
    ::neraly::nearly
    :C:need ot::need to
    ::needt o::need to
    :C:needed ot::needed to
    :C:needs ot::needs to
    ::negligibel::negligible
    ::neigbhor::neighbor
    ::neigbhors::neighbors
    :*:entwork::network             ; network/s/ed/ing
    ::nerual::neural
    ::neurla::neural
    ::neutrla::neutral
    ::enxt::next
    :C:onde::node
    :C:ndoe::node
    ::ondes::nodes
    ::ndoes::nodes
    :C:NOne::None                   ; Python keyword
    :*:northwset::northwest
    :C:Nto::Not
    :C:NOt::not
    ::ntoe::note
    ::ntoed::noted
    ::ntoepad::notepad
    ::ntoes::notes
    ::nohting::nothing
    :*:ntoif::notif                 ; notif/y/ied/ication
    ::notifcation::notification
    ::notifcations::notifications
    ::nulll::null
    ::nulopt::nullopt               ; C++ keyword
    ::nulllopt::nullopt
    ::nulptr::nullptr               ; C++ keyword
    ::nulllptr::nullptr
    ::nubmer::number
    ::nubmers::numbers
    ::numbesr::numbers
    :*:nuemr::numer                 ; ex: numerator, numeric, numeral

    :*:ojbect::object               ; object/s, objective/s
    :*:obejct::object
    :*:obesrv::observ               ; observ/able/ation/e/ed/er
    :*:occassion::occasion          ; occasion/s/ally
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
    ::ofthat::of that
    ::fo that::of that
    ::ofthe::of the
    ::ofteh::of the
    ::ofhte::of the
    ::fo the::of the
    ::oft he::of the
    ::of th::of the
    ::ofthis::of this
    ::fo this::of this
    ::offiical::official
    ::offical::official
    ::offest::offset
    ::odlest::oldest
    ::onthe::on the
    ::oens::ones
    ::onlien::online
    ::onlly::only
    :C:ONly::Only
    ::opesn::opens
    :*:oeprat::operat               ; operat/es/ed/ion/ional
    :*:opereat::operate
    ::operaeting::operating
    :*:opeation::operation          ; operation/al/s
    :*:operaetion::operation
    ::opeator::operator
    ::opeartor::operator
    ::opeators::operators
    ::opeartors::operators
    ::opporutnity::opportunity
    ::optgorup::optgroup            ; HTML tag
    ::optgropu::optgroup
    :*:optmi::optim                 ; optim/al/ise/ized
    ::otpimal::optimal
    :*:optizmi::optimiz             ; optimiz/e/ed/es/ation
    ::optimiation::optimization
    ::optiimzation::optimization
    ::optimiations::optimizations
    ::optiimzations::optimizations
    ::optimze::optimize
    ::optimzed::optimized
    ::optimzes::optimizes
    :*:otpion::option               ; option/s/al/ally
    ::optioal::optional
    :*:odrer::order                 ; order/s/ed/ing
    ::ordianry::ordinary
    :*:oragnis::organis             ; organis/e/ed/es/ation
    :*:oragniz::organiz
    :*:oritent::orient              ; orient/s/ed/ation
    :*:oreint::orient
    ::oriign::origin
    ::orignal::original
    ::orignial::original
    ::oriigns::origins
    :*:orhto::ortho                 ; orthogonal/ise/ities, orthonormal
    :*:ohter::other                 ; other/s/wise
    ::otehrs::others
    ::otehrwise::otherwise
    ::otheriwse::otherwise
    ::otherwies::otherwise
    ::otu of::out of
    ::outocme::outcome
    ::outocmes::outcomes
    ::outcomse::outcomes
    ::otuer::outer                  ; exception for '-tuer' -> '-ture'
    ::otuput::output
    ::ouptut::output
    ::otuputs::outputs
    ::ouptuts::outputs
    :*:overlfow::overflow           ; overflow/s/ed/ing
    ::overhaed::overhead
    ::overiden::overridden
    ::overidden::overridden
    ::overriden::overridden
    ::overide::override             ; cannot do ':*:' b/c of words like overidealize and overidentify
    ::overides::overrides
    ::oveview::overview
    :*:overwheml::overwhelm         ; overwhelm/s/ed/ing
    :*:overhwelm::overwhelm
    ::overwrtie::overwrite
    ::overwrties::overwrites
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
    ::apged::paged
    ::apges::pages
    ::paitner::painter
    ::paitners::painters
    :*:apir<::pair<                 ; C++ template container
    :*:pari<::pair<
    ::pallette::palette             ; ex: VSCode Command Palette
    ::palindrmoe::palindrome
    ::palindrmoes::palindromes
    ::paenl::panel
    ::paenls::panels
    :*:paralel::parallel            ; parallel/s/ise/ize/ism
    :*:parllel::parallel
    :*:aprallel::parallel
    :*:parlalel::parallel
    :*:praallel::parallel
    ::parallelsim::parallelism
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
    ::parentehses::parentheses
    ::praents::parents
    ::parenets::parents
    ::aprents::parents
    ::paretns::parents
    ::parofr::parfor                ; MATLAB parallel loop
    :*:pasre::parse                 ; parse/d/s/r
    ::parisng::parsing
    ::parital::partial
    :*:paritc::partic               ; partic/ipant/ipate/ular
    ::participnat::participant
    ::participnats::participants
    ::parituclar::particular
    ::partiuclar::particular
    :*:partiton::partition          ; partition/s/ed/ing
    :*:parittion::partition
    :*:parition::partition
    ::partitoining::partitioning
    :*:partenr::partner             ; partner/s/ed/ing/ship
    ::pasive::passive
    ::passwrod::password
    ::pasword::password
    ::passowrd::password
    ::passwrods::passwords
    ::paswords::passwords
    ::passowrds::passwords
    ::paht::path
    ::pahtlib::pathlib
    ::pahtname::pathname
    ::pahts::paths
    ::apttern::pattern
    ::patern::pattern
    ::aptterns::patterns
    ::paterns::patterns
    ::pyament::payment
    ::pyaments::payments
    ::pedatnic::pedantic
    ::peopel::people
    ::perceptorn::perceptron
    ::perceptorns::perceptrons
    ::eprf::perf
    :*:eprform::perform             ; perform/s/ed/ance
    :*:perofrm::perform
    :*:peform::perform
    ::perfomance::performance
    ::perofmrance::performance
    ::perfomrance::performance
    ::perforamnce::performance
    ::performnat::performant
    ::perofmrant::performant
    ::perofmed::performed
    ::perihperal::peripheral
    ::perihperals::peripherals
    ::permanet::permanent
    ::permenant::permanent
    ::permanant::permanent
    ::perimt::permit
    ::perimts::permits
    ::perimtted::permitted
    ::permited::permitted
    ::permtuation::permutation
    ::pemrutation::permutation
    :*:permtue::permute             ; permute/s/d
    :*:pemrute::permute
    ::perpendiuclar::perpendicular
    :*:persit::persist              ; persist/s/ed/ent/ing
    ::persistant::persistent
    ::peristent::persistent
    :*:perosn::person               ; person/al/alize/nel
    ::persepctive::perspective
    ::persepctives::perspectives
    ::pertubation::perturbation
    ::pikc::pick
    ::pikcs::picks
    ::pidgeonhole::pigeonhole       ; pigeonhole principle
    ::pipelien::pipeline
    ::pipeilne::pipeline
    ::pipeliens::pipelines
    ::pipeilnes::pipelines
    ::pixesl::pixels
    ::placehodler::placeholder
    ::placehodlers::placeholders
    ::palcement::placement
    ::paln::plan
    ::palne::plane
    ::palnes::planes
    ::palnned::planned
    ::planend::planned
    ::palnning::planning
    ::palns::plans
    ::platfom::platform
    ::paltform::platform
    ::platfoms::platforms
    ::paltforms::platforms
    ::playesr::players
    ::pleae::please
    ::pleaes::please
    ::plto::plot
    ::pltos::plots
    ::pluign::plugin
    ::pluigns::plugins
    ::piotn::point
    ::pionter::pointer
    ::poitner::pointer
    ::opinter::pointer
    ::pionters::pointers
    ::poitners::pointers
    ::opinters::pointers
    ::piotns::points
    ::oplicy::policy
    ::oplling::polling
    ::polymorhpic::polymorphic
    ::polynomail::polynomial
    ::polynomails::polynomials
    :C:pop+back::pop_back           ; common C++ container function
    :*:popualte::populate           ; populate/d/s
    ::postion::position
    ::opsition::position
    ::positoining::positioning
    ::postions::positions
    ::opsitions::positions
    ::posible::possible
    ::posisble::possible
    ::possibel::possible
    :*:pwoer::power                 ; power/s/ed/point/shell
    :*:opwer::power
    ::ppritn::pprint                ; Python pretty printer
    ::pratice::practice
    ::praticed::practiced
    ::pratices::practices
    ::praticing::practicing
    ::prgama::pragma                ; #pragma
    ::prealocate::preallocate
    ::preallcoate::preallocate
    ::prealocated::preallocated
    ::preallcoated::preallocated
    ::prealocates::preallocates
    ::preallcoates::preallocates
    :*:preceede::precede            ; precede/d/s/nce/nts
    ::preicsion::precision
    :*:preocmput::precomput         ; precomput/e/es/ed/ing
    ::predecssor::predecessor
    ::predecesor::predecessor
    ::rpedicate::predicate          ; a function returing true/false
    ::preidcate::predicate
    :*:preidct::predict
    ::prefered::preferred
    ::prefecth::prefetch
    ::prefethc::prefetch
    ::rpefix::prefix
    ::preifx::prefix
    ::prmeiere::premiere
    ::prmeiered::premiered
    ::prmeieres::premieres
    :*:prpear::prepar               ; prepar/e/es/ed/ation
    :*:preprae::prepare
    :*:preporcess::preprocess       ; preprocess/es/or/ing
    ::preprocesor::preprocessor
    :*:presetn::present             ; present/s/ed/er/ers/ation
    :*:prserve::preserve            ; preserve/s/d/r
    ::prevelant::prevalent
    :*:prevetn::prevent             ; prevent/s/ed/ion/able
    :*:prvent::prevent
    :*:prevenet::prevent
    ::preivous::previous
    ::primarly::primarily
    ::pirmary::primary
    ::priamry::primary
    ::priemr::primer
    ::primiive::primitive
    ::pritn::print
    ::pritner::printer
    ::pritners::printers
    ::pritnf::printf
    ::pritning::printing
    ::pritnln::println
    ::pritns::prints
    ::priorty::priority
    ::priotrity::priority
    ::prioirty::priority
    ::privte::private
    :*:privelege::privilege         ; privilege/s/d
    :*:priviledge::privilege
    ::probablistic::probabilistic
    ::probabalistic::probabilistic
    :*:probelm::problem             ; problem/s, problematic
    :*:problme::problem
    :*:prblem::problem
    :*:porblem::problem
    :*:rpoblem::problem
    ::problesm::problems
    :*:proceudr::procedur           ; procedure/s, procedural/ly
    :*:proecdur::procedur
    ::procedurla::procedural
    :*:proceess::process            ; process/es/ing/or
    :*:porcess::process
    ::processesd::processed
    ::proceses::processes
    ::procesing::processing
    ::procesor::processor
    ::proceesor::processor
    ::procesors::processors
    ::proceesors::processors
    :*:proudce::produce             ; produce/d/r/s/rs
    :*:prdouce::produce
    :*:prodcue::produce
    ::produer::producer
    ::produers::producers
    :*:proudct::product             ; product/s/ion/ive/ivity
    :*:prdouct::product
    :*:prodcut::product
    :*:proflie::profile             ; profile/d/s/r
    :*:profiel::profile
    :*:prgoram::program             ; program/s/med/ming/mable/matic
    :*:porgram::program
    :*:progrma::program
    ::programable::programmable
    ::programatic::programmatic
    ::programing::programming
    :*:proejct::project             ; project/s/ed/ing/ion
    :*:prjoect::project
    ::promsie::promise
    ::pormise::promise
    ::proimse::promise
    :*:proofraed::proofread         ; proofread/s/er/ing
    ::proepr::proper
    ::proeprties::properties
    ::propeties::properties
    ::proeprty::property
    ::propety::property
    ::proprietray::proprietary
    ::propreitary::proprietary
    ::propreitray::proprietary
    :*:prtoect::protect             ; protect/s/ed/or/ing/ion
    ::prtoocol::protocol
    ::protocl::protocol
    ::protcol::protocol
    ::prtoocols::protocols
    ::protocls::protocols
    ::protcols::protocols
    ::proove::prove
    ::prooved::proved
    ::prooves::proves
    ::proxiimty::proximity
    :*:pesudo::pseudo               ; pseudocode, pseudorandom
    :*:psuedo::pseudo
    ::pubilc::public
    ::pubicl::public
    :*:publihs::publish             ; publish/ed/er/es/ing
    ::upll::pull
    ::uplled::pulled
    ::uplling::pulling
    ::uplls::pulls
    ::puhs::push
    :C:upsh::push
    :C:push+back::push_back         ; common C++ container function
    ::puhs_back::push_back
    ::upsh_back::push_back
    ::puhses::pushes
    ::pythno::python
    ::pyton::python
    ::pythohn::python
    :C:PYthon::Python
    ::pyhton::python
    ::pytohn::python

    ::qualyit::quality
    :*:quatn::quant                 ; quant/um/ity/itative
    ::quantites::quantities
    ::quanitty::quantity
    ::quanttiy::quantity
    ::quantiyt::quantity
    ::qurater::quarter
    ::qeuried::queried
    ::queired::queried
    ::quried::queried
    ::qeuries::queries
    ::queires::queries
    ::quries::queries
    :*:queyr::query                 ; query/ing, queryArgs, queryParameters
    :*:qeury::query
    :*:qurey::query
    :*:uqeyr::query
    ::qury::query
    :*:qeust::quest                 ; quest/ion/ions/ioning
    :*:qustion::question            ; question/s/ed/ing/able
    :*:quetion::question
    :*:quetsion::question
    ::queu::queue
    ::qeuue::queue
    ::qeueu::queue
    ::qeue::queue
    ::queeu::queue
    ::qeueue::queue
    ::queud::queued
    ::qeuued::queued
    ::qeueud::queued
    ::qeued::queued
    ::queeud::queued
    ::qeueued::queued
    ::queus::queues
    ::qeuues::queues
    ::qeueus::queues
    ::qeues::queues
    ::queeus::queues
    ::qeueues::queues
    :*:qiuck::quick                 ; quickly, quicksort, quickselect
    :*:quikc::quick
    ::quickyl::quickly
    ::quicly::quickly
    ::quicksleect::quickselect

    ::rakc::rack
    ::rakcs::racks
    ::riase::raise
    ::riased::raised
    ::riases::raises
    :*:ranodm::random               ; random/ly/ise/ize/ization
    :*:rnadom::random
    :*:rnaodm::random
    ::rnage::range
    :C:ragne::range
    ::rnaged::ranged
    ::ragned::ranged
    ::rnages::ranges
    ::ragnes::ranges
    :C*:ranges`:`;::ranges`:`:      ; 'ranges:;' -> 'ranges::'. Common C++ namespace
    :C*:rangeS`:`:::ranges`:`:      ; 'rangeS::' -> 'ranges::'
    :C*:ranges`;`:::ranges`:`:      ; 'ranges;:' -> 'ranges::'
    ::rtaio::ratio
    ::raeding::reading
    ::raedy::ready
    :*:reaosn::reason               ; reason/s/ed/ing/able
    ::reblance::rebalance
    :*:reblaance::rebalance         ; rebalance/d/r/s/rs
    ::rebulid::rebuild
    ::rebiuld::rebuild
    ::rebulids::rebuilds
    ::rebiulds::rebuilds
    :*:reciev::receiv               ; receiv/able/e/ed/er/ing
    ::receivs::receives
    ::recnet::recent
    ::recenet::recent
    :*:recognies::recognise         ; recognise/s/ed/er
    :*:recogniez::recognize         ; recognize/s/ed/er
    ::reconcileable::reconcilable
    ::recrod::record
    ::recroded::recorded
    ::recroding::recording
    ::recrods::records
    ::recrutier::recruiter
    ::recrutiers::recruiters
    :*:rectnagl::rectangl          ; rectangl/e/es/ar
    :*:recntagl::rectangl
    :*:rectangel::rectangle
    :*:rectnagel::rectangle
    ::recurrance::recurrence
    :*:recusi::recursi              ; recursi/ve/on/ng/vely
    :*:recusri::recursi
    :*:recuris::recursi
    ::recycel::recycle
    ::recyceld::recycled
    ::recycels::recycles
    :*:reudce::reduce               ; reduce/s/d/r
    ::reduceble::reducible
    ::reudction::reduction
    ::reudtcion::reduction
    ::reudctions::reductions
    ::reudtcions::reductions
    ::redundnat::redundant
    :*:refator::refactor            ; refactor/s/ed/ing
    :*:refacotr::refactor
    :*:refernce::reference          ; reference/s/r/d
    :*:refrence::reference
    ::referal::referral
    ::referals::referrals
    ::refersh::refresh
    ::refershed::refreshed
    ::refershes::refreshes
    ::regiosn::regions
    :*:registser::register          ; register/s/ed/ing
    :*:reigster::register
    ::registyr::registry
    ::regresion::regression
    ::regresions::regressions
    ::reuglar::regular
    :*:regualte::regulate           ; regulate/d/s
    ::reimaeg::reimage
    ::reinforcment::reinforcement
    ::rleate::relate
    ::rleated::related
    ::rleates::relates
    :*:relait::relati               ; relati/ng/on/ve/onship
    :*:rleation::relation           ; relations, relational, relationships
    :*:releation::relation
    ::relatioal::relational
    ::relatinoship::relationship
    ::relationshp::relationship
    ::reltaionship::relationship
    ::relatinoships::relationships
    ::relationshps::relationships
    ::reltaionships::relationships
    ::rleative::relative
    ::rleatives::relatives
    ::releaes::release
    ::releaess::releases
    ::relevnat::relevant
    :*:remian::remain               ; ex: remain/s/ed/der/ing
    :*:remina::remain
    ::remaiing::remaining
    ::remaning::remaining
    ::remkae::remake
    ::remaek::remake
    ::remnnat::remnant
    :*:rmeove::remove               ; remove/s/d/r
    :*:remvoe::remove
    :*:reomve::remove
    :*:rmoeve::remove
    ::reepat::repeat
    ::reepated::repeated
    ::reepatedly::repeatedly
    ::repetaedly::repeatedly
    ::repating::repeating
    ::repaeting::repeating
    ::reepats::repeats
    ::repeelm::repelem              ; common MATLAB function
    ::repetitve::repetitive
    :*:repalce::replace             ; replace/s/d/ment/able
    :*:replya::replay               ; replay/s/ed/er/ing
    :*:repaly::replay
    :*:replcia::replica             ; replica/s/te/tion
    :*:repliac::replica
    :*:rpelica::replica
    :*:repilca::replica
    ::repleid::replied
    ::repleis::replies
    ::repamt::repmat                ; common MATLAB function
    :*:reoprt::report               ; report/s/ed/er/ing
    ::repostiroies::repositories
    ::repositoroies::repositories
    ::reposistories::repositories
    ::reopsitories::repositories
    ::repositroies::repositories
    ::repostiories::repositories
    ::repositrories::repositories
    ::reposotires::repositories
    ::repostiries::repositories
    ::repsotiries::repositories
    ::repostiroy::repository
    ::repositoroy::repository
    ::reposistory::repository
    ::reopsitory::repository
    ::repositroy::repository
    ::repostiory::repository
    :*:represnet::represent         ; represent/s/ed/ing/ation
    :*:reprsent::represent
    :*:represnt::represent
    ::reproducable::reproducible
    :*:requst::request              ; request/s/ed/ing
    :*:reqeust::request
    :*:rquest::request
    :*:reuqest::request
    :*:rqeust::request
    :*:reuest::request
    :*:requset::request
    ::requets::request
    ::requesets::requests
    :*:reuqire::require             ; require/s/d/ment
    :*:requrie::require
    :*:requrei::require
    :*:requier::require
    :*:rquire::require
    :*:rqeuire::require
    :*:rqurie::require
    :*:reqruie::require
    :*:reqiure::require
    :*:reuire::require
    :*:reuiqre::require
    ::requird::required
    ::requied::required
    ::requirment::requirement
    ::rquirment::requirement
    ::requiement::requirement
    ::reqruiment::requirement
    ::requirments::requirements
    ::rquirments::requirements
    ::requiements::requirements
    ::reqruiments::requirements
    ::requies::requires
    ::requirse::requires
    ::requirs::requires
    ::reraed::reread
    :*:resaerch::research           ; research/ed/es/ing
    :*:reserach::research
    :*:resarch::research
    ::rserve::reserve
    ::resrve::reserve
    ::rserved::reserved
    ::resrved::reserved
    ::rserves::reserves
    ::resrves::reserves
    :*:rehsape::reshape             ; common MATLAB function
    :*:rehspae::reshape
    ::reisded::resided
    ::residnet::resident
    ::residnets::residents
    ::residaul::residual
    ::resileincy::resiliency
    ::reislient::resilient
    ::reoslution::resolution
    ::resoultion::resolution
    ::reoslutions::resolutions
    ::resoultions::resolutions
    :*:reoslve::resolve             ; resolve/d/r/s
    :*:resovle::resolve
    ::resovling::resolving
    ::resoruce::resource
    ::reosurce::resource
    ::resoruces::resources
    ::reosurces::resources
    :*:respodn::respond             ; respond/s/ed/er/ers
    :*:resopnd::respond
    :*:repsond::respond
    ::resopnse::response
    ::respones::response
    ::repsonse::response
    ::resposne::response
    ::resopnses::responses
    ::responess::responses
    ::repsonses::responses
    ::resposnes::responses
    ::responsibel::responsible
    ::restrat::restart
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
    :*:resuelt::result
    :*:rseult::result
    :*:rselut::result
    :*:rseuelt::result
    :*:rseulet::result
    :*:reustl::result
    :*:restul::result
    :*:ersult::result
    :*:resltu::result
    :*:rseutl::result
    :*:ruselt::result
    ::reults::results
    ::resulst::results
    ::resuem::resume
    ::resuemd::resumed
    ::resuems::resumes
    ::retian::retain
    ::retians::retains
    :*:retreiv::retriev             ; retriev/al/able/e/er
    ::retrive::retrieve
    ::retrives::retrieves
    :*:reutrn::return               ; return/s/ed/ing
    :*:retrn::return
    :*:retrun::return
    :*:retunr::return
    :*:reurtn::return
    :*:reutnr::return
    :*:reeturn::return
    :*:retuern::return
    ::reurn::return
    :*:erturn::return
    :*:retur n::return `            ; ex: 'retur ntrue' (` used to add trailing space)
    ::returnd::returned
    ::returend::returned
    ::retursn::returns
    ::revesre::reverse
    ::revesred::reversed
    ::reverisng::reversing
    :*:reivew::review               ; review/s/ed/er/ing
    :*:reveiw::review
    ::reivsion::revision
    ::reivsions::revisions
    :*:reviist::revisit             ; revisit/s/ed/ing
    :*:reawrd::reward               ; reward/s/ed/ing
    :*:rewtach::rewatch             ; rewatch/ed/ing
    ::rewriet::rewrite              ; COBOL statement
    ::rewirte::rewrite
    :*:rigth::right                 ; right/s, rightChild
    :*:rihgt::right
    :*:irght::right
    :*:rigiht::right
    :*:righit::right
    ::rolback::rollback
    ::orund::round
    ::orunded::rounded
    ::orunds::rounds
    ::rotue::route
    ::rotuer::router                ; exception for -tuer  -> -ture
    ::rotuers::routers              ; exception for -tuers -> -tures
    :C:ruel::rule
    ::rueld::ruled
    ::ruels::rules
    ::runenr::runner
    ::runenrs::runners
    ::runing::running
    :C:RUst::Rust

    ::sfae::safe
    :C:saef::safe
    ::sfaer::safer
    ::saefr::safer
    ::sfaest::safest
    ::saefst::safest
    ::sfaety::safety
    ::saefty::safety
    ::smae::same
    ::sampel::sample
    ::smaple::sample
    ::sampeld::sampled
    ::smapled::sampled
    ::sampelr::sampler
    ::smapler::sampler
    ::sampels::samples
    ::smaples::samples
    ::svae::save
    ::svaed::saved
    ::svaes::saves
    ::svaing::saving
    ::scaleable::scalable
    ::saclable::scalable
    ::sacling::scaling
    ::scneario::scenario
    ::scnearios::scenarios
    :*:scheudl::schedul             ; schedule/s/d/r, scheduling
    :*:schedlu::schedul
    ::scheduelr::scheduler
    ::shcema::schema
    ::schmea::schema
    ::shcmea::schema
    ::sicence::science
    ::sicnece::science
    ::sicences::sciences
    ::sicneces::sciences
    ::socpe::scope
    ::socped::scoped
    ::socpes::scopes
    ::scroe::score
    ::scroes::scores
    :*:scritp::script               ; script/s/ed/ing
    :*:sript::script
    :*:sritp::script
    :*:scirpt::script
    :*:serach::search               ; search/ed/es/ing/able
    :*:saerch::search
    :*:esarch::search
    ::sarch::search
    ::sarched::searched
    ::sarches::searches
    :*:seocnd::second               ; second/s/ary/hand
    :*:secodn::second
    ::escondary::secondary
    ::secondayr::secondary
    ::seconsd::seconds
    ::secuirty::security
    ::secrutiy::security
    ::seucrity::security
    ::segfautl::segfault
    :*:sleect::select               ; select/s/ion/ions
    :*:seelct::select
    ::select * form::select * from  ; common sql selection
    ::select 8 from::select * from
    ::selectes::selects
    ::slef::self                    ; Python current class instance
    :C:eslf::self
    ::sematnic::semantic
    ::sematnics::semantics
    :C:SendINput::SendInput         ; common AutoHotkey function
    ::senstivity::sensitivity
    ::setnence::sentence
    ::senetnce::sentence
    ::setnences::sentences
    ::senetnces::sentences
    :*:seperat::separat             ; separate, separation, separator
    ::seprate::separate
    ::seprated::separated
    ::seprates::separates
    :*:seuqen::sequen               ; sequen/ce/ces/cing/tial
    :*:seqeuen::sequen
    :*:seqeun::sequen
    :*:seuenc::sequenc
    ::seuqnce::sequence
    ::sequnce::sequence
    ::seuqnces::sequences
    ::sequnces::sequences
    ::serliase::serialise
    ::serliased::serialised
    ::serliases::serialises
    ::serliaze::serialize
    ::serliazed::serialized
    ::serliazes::serializes
    ::serise::series
    ::sersver::server
    ::servver::server
    ::servfer::server
    ::serfver::server
    ::esrver::server
    ::sersvers::servers
    ::servvers::servers
    ::servfers::servers
    ::serfvers::servers
    ::esrvers::servers
    ::serivce::service
    ::esrvice::service
    ::srevice::service
    ::ersvice::service
    ::servce::service
    ::sersvice::service
    ::servcie::service
    ::serivces::services
    ::esrvices::services
    ::srevices::services
    ::ersvices::services
    ::servces::services
    ::sersvices::services
    ::servcies::services
    ::setapram::setparam            ; Kotlin soft keyword
    :C:setTimeotu::setTimeout       ; JavaScript function
    ::sevearl::several
    ::serverity::severity
    :*:shaodw::shadow               ; shadow/s/ed/ing
    ::shall nto::shall not
    ::shaep::shape
    ::shpae::shape
    ::shaepd::shaped
    ::shpaed::shaped
    ::shaeps::shapes
    ::shpaes::shapes
    :*:hsard::shard                 ; shard/s/ed/ing
    ::shareded::sharded
    ::sahred::shared
    ::hsared::shared
    ::shaerd::shared
    ::shraed::shared
    ::shrot::short
    ::shrotcut::shortcut
    ::shortctu::shortcut
    ::shortuct::shortcut
    ::shortctus::shortcuts
    ::shortucts::shortcuts
    ::shrotest::shortest
    ::shrots::shorts
    ::shoud::should
    ::shoudl::should
    ::hsould::should
    ::shuld::should
    ::should nto::should not
    ::shoudn't::shouldn't
    ::shoudln't::shouldn't
    ::hsouldn't::shouldn't
    ::shuldn't::shouldn't
    ::shouldnt'::shouldn't
    ::hsow::show
    ::hsowed::showed
    ::hsowing::showing
    ::hsows::shows
    ::shirnk::shrink
    ::shirnking::shrinking
    ::shirnks::shrinks
    ::sidewyas::sideways
    :*:signla::signal               ; signal/s/ed/er/ing
    ::sigend::signed
    ::significnat::significant
    ::significatn::significant
    ::significnatly::significantly
    ::significatnly::significantly
    ::ismilar::similar
    ::simlar::similar
    ::similarty::similarity
    ::simlarity::similarity
    ::simpelr::simpler
    ::simplifes::simplifies
    :*:simualte::simulate           ; simulate/d/s
    ::simulatenous::simultaneous
    ::signle::single
    ::singel::single
    ::siez::size
    :C:isze::size
    :C:szie::size
    ::sie of::size of
    :C:size90::size()               ; missing shift key during 'size()'
    :C:sie_t::size_t                ; common C++ data type
    :C:sizet::size_t
    :C:size_T::size_t
    :C:size-t::size_t
    ::sieof::sizeof
    ::siezs::sizes
    ::szies::sizes
    ::slwo::slow
    ::slwoer::slower
    ::slwoest::slowest
    ::samll::small
    ::samller::smaller
    ::smalelst::smallest
    ::smoohting::smoothing
    ::snaphsot::snapshot
    ::snaphsots::snapshots
    ::sockte::socket
    ::socktes::sockets
    ::osftware::software
    ::sofware::software
    ::soltion::solution
    ::oslution::solution
    ::soltions::solutions
    ::oslutions::solutions
    ::sovlable::solvable
    :*:sovle::solve                 ; solve/s/d/r/rs
    ::sovling::solving
    ::smoe::some
    ::osme::some
    :C:soem::some
    :C:Soem::some
    ::soemone::someone
    ::somehing::something
    ::smoething::something
    ::osmething::something
    ::somehting::something
    ::someting::something
    ::soemthing::something
    ::osmetime::sometime
    ::osmetimes::sometimes
    :*:srot::sort                   ; sort/s/ed/ing/able
    :*:osrt::sort
    :C:SOrt::Sort
    :*:sorrt::sort
    ::soretd::sorted
    ::sortd::sorted
    ::soruce::source
    ::soruces::sources
    ::sorucing::sourcing
    ::sprase::sparse
    ::spaital::spatial
    ::spawsn::spawns
    ::speical::special
    :*:speciifc::specific           ; specific/s/ly/ied/ation
    ::spetn::spent
    ::sproadic::sporadic
    ::sproadically::sporadically
    ::spraeds::spreads
    ::spraedsheet::spreadsheet
    ::spradsheet::spreadsheet
    ::spraedsheets::spreadsheets
    ::spradsheets::spreadsheets
    ::spritnf::sprintf              ; common string formatting function
    ::sqltie::sqlite
    ::slqite::sqlite
    ::sqltie3::sqlite3
    ::slqite3::sqlite3
    ::squre::square
    ::squrae::square
    ::suqare::square
    ::sqaure::square
    ::squred::squared
    ::sqraed::squared
    ::suqared::squared
    ::sqaured::squared
    ::squres::squares
    ::suqares::squares
    ::sqaures::squares
    ::stabel::stable
    :*:stakc::stack                 ; stack/s/ed/ing/able
    :*:satck::stack
    ::stmap::stamp
    ::stnadard::standard
    ::stnadards::standards
    ::starrt::start
    ::staretd::started
    ::starrted::started
    ::starrts::starts
    ::stahs::stash                  ; git stash
    :*:staet::state                 ; state/d/s/ful/less/ment
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
    ::stesp::steps
    ::setps::steps
    ::stokc::stock
    :C:sotp::stop
    ::sotps::stops
    ::stopwtach::stopwatch
    ::stopawtch::stopwatch
    ::stoarge::storage
    ::stoage::storage
    ::stroage::storage
    ::storeage::storage
    ::tsorage::storage
    :C:stroe::store
    ::tsore::store
    :C:sotre::store
    ::tsored::stored
    ::stroes::stores
    ::tsores::stores
    :*:striaght::straight           ; straight/s/en/forward
    ::streategy::strategy
    ::strema::stream
    ::straem::stream
    ::stremaed::streamed
    ::straemed::streamed
    ::stremaing::streaming
    ::straeming::streaming
    ::stremas::streams
    ::straems::streams
    :*:strenght::strength           ; strength/en/ens/ened/ening
    ::striek::strike
    :*:sring::string                ; ex: string/s/ent/ify
    :*:stirng::string
    :*:tsring::string
    :*:stinrg::string
    ::storng::strong
    ::stornger::stronger
    ::storngest::strongest
    ::stuct::struct
    ::strcut::struct
    ::sturct::struct
    :*:strutur::structur            ; structur/e/ed/al/es
    :*:structcur::structur
    :*:strucutr::structur
    ::structurla::structural
    ::structre::structure
    :*:sturcture::structure
    ::styel::style
    ::sytle::style
    ::styeld::styled
    ::sytled::styled
    ::styels::styles
    ::sytles::styles
    ::sytling::styling
    ::subaray::subarray
    ::subarary::subarray
    ::subarrray::subarray
    ::subarays::subarrays
    ::subararys::subarrays
    ::subarrrays::subarrays
    ::subcateogyr::subcategory
    ::subcatagory::subcategory
    ::subclas::subclass
    ::subexpresison::subexpression
    ::subexpresion::subexpression
    ::submisosin::submission
    ::submisosins::submissions
    ::submoduel::submodule
    ::submoduels::submodules
    :*:subcribe::subscribe          ; subscribe/d/r/s
    ::subscribesr::subscribers
    ::subscritp::subscript          ; Swift keyword
    ::subscirpt::subscript
    ::subseuqnce::subsequence
    ::subsequnce::subsequence
    ::subseuqnces::subsequences
    ::subsequnces::subsequences
    ::subseuqent::subsequent
    ::subsequenet::subsequent
    ::subseuqently::subsequently
    ::usbset::subset
    ::usbsets::subsets
    ::substitue::substitute
    ::substittue::substitute
    ::substtitue::substitute
    ::subsring::substring
    ::subsstring::substring
    ::subsrings::substrings
    ::subsstrings::substrings
    ::subract::subtract
    ::subracted::subtracted
    ::subracts::subtracts
    :*:suceed::succeed              ; succeed/s/ed/ing
    :*:sucess::success              ; success/ful/fully/or/ive
    ::succes::success
    ::succesful::successful
    ::successfuly::successfully
    ::succesfully::successfully
    ::succesor::successor
    :C:usch::such
    ::suhc::such
    ::suggets::suggest
    ::sutie::suite                  ; test suite
    ::suties::suites
    ::sumarize::summarize
    ::sumary::summary
    :*:suepr::super                 ; super/class/script/sede/vised
    ::superscritp::superscript
    ::superscirpt::superscript
    ::superivsed::supervised
    ::superivses::supervises
    ::suppleid::supplied
    :*:suport::support              ; support/s/ed/ing/ive
    :*:uspport::support
    :*:surorund::surround           ; surround/s/ed/ing
    :C:sawp::swap
    :*:siwthc::switch               ; switch/es/ing/case
    :*:siwtch::switch
    :*:swich::switch
    :*:swtich::switch
    :*:swithc::switch
    :*:synchor::synchro             ; synchronous/ly, synchronized
    :*:syncrho::synchro
    ::synchroniation::synchronization
    ::sychrnous::synchronous
    ::sytnax::syntax
    ::sytnaxes::syntaxes
    :*:sytsem::system               ; system/s/ic/atic
    :*:ssytem::system
    :*:sytem::system
    :*:sysetm::system
    :*:systme::system
    :*:sytesm::system
    ::sysem::system
    ::sysems::systems

    ::tabel::table
    ::tabels::tables
    ::tkae::take
    ::tkaen::taken
    ::takne::taken
    ::taekn::taken
    :C:takse::takes
    ::taeks::takes
    :C:tlak::talk
    ::tlaked::talked
    ::tlaker::talker
    ::tlaking::talking
    ::tlaks::talks
    :*:traget::target               ; target/s/ed/er/ing
    :C:taks::task
    ::taksed::tasked
    ::takss::tasks
    :*:tehcn::techn                 ; technology, technical, technique
    ::techincal::technical
    ::techncial::technical
    ::techinque::technique
    ::technqiue::technique
    ::techniqeu::technique
    ::techniuqe::technique
    ::technqieu::technique
    ::techinques::techniques
    ::technqiues::techniques
    ::techniqeus::techniques
    ::techniuqes::techniques
    ::technqieus::techniques
    ::temmplate::template
    ::templae::template
    ::tem[late::template
    ::temlate::template
    ::tempalet::template
    ::tempalte::template
    ::temmplates::templates
    ::templaes::templates
    ::temlates::templates
    ::tempalets::templates
    ::tempaltes::templates
    ::tempoarl::temporal
    ::tempoarry::temporary
    ::temoprary::temporary
    ::temporayr::temporary
    ::tendancy::tendency
    ::temrinal::terminal
    ::temrinals::terminals
    ::termiante::terminate
    ::termianted::terminated
    ::termiantes::terminates
    ::testcaes::testcase
    ::tetsing::testing
    ::textula::textual
    ::texutal::textual
    ::htan::than
    :C:tahn::than
    ::thna::than
    ::htat::that
    ::taht::that
    ::thta::that
    :C:THat::That
    ::tha tis::that is
    ::tha tit::that it
    :C:hte::the
    :C:teh::the
    :C:Teh::The
    ::thte::the
    ::tjhe::the
    :C:tthe::the
    :C:THe::The
    ::thje::the
    ::hteir::their
    ::theri::their
    ::thier::their
    ::htem::them
    ::theem::theme
    ::hteme::theme
    ::hten::then
    :C:THen::Then
    ::theorme::theorem
    ::theormes::theorems
    ::theortical::theoretical
    ::htere::there
    ::tehre::there
    :C:THere::There
    ::therfore::therefore
    ::hterefore::therefore
    ::tehrefore::therefore
    :C:THerefore::Therefore
    ::threfore::therefore
    ::htese::these
    ::thees::these
    ::tehse::these
    :C:THese::These
    ::htey::they
    :C:thye::they
    ::htye::they
    :C:THey::They
    :C:tehy::they
    ::theyr'e::they're
    ::hting::thing
    ::htings::things
    ::thikn::think
    ::htink::think
    ::htinking::thinking
    ::htird::third
    ::thidr::third
    ::thsi::this
    ::htis::this
    ::tihs::this
    :C:THis::This
    :C:tsih::this
    :C:thisis::this is
    ::thsoe::those
    ::htose::those
    :C:THose::Those
    :*:thoguht::thought             ; thought/s/ful/fully
    ::thrad::thread
    ::htread::thread
    ::thraed::thread
    ::thrading::threading
    ::htreading::threading
    ::thraeding::threading
    ::thrads::threads
    ::htreads::threads
    ::thraeds::threads
    ::thershold::threshold
    ::throuhg::through
    ::throuhgput::throughput
    ::throughptu::throughput
    ::thoruhgput::throughput
    ::thorw::throw
    ::htrow::throw
    ::thorwn::thrown
    ::htrown::thrown
    ::thorws::throws
    ::htrows::throws
    :C:tiel::tile
    ::tield::tiled
    ::tiels::tiles
    ::timelien::timeline
    ::itmeline::timeline
    ::timeliens::timelines
    ::itmelines::timelines
    ::timeotu::timeout
    ::tiemout::timeout
    ::itmeout::timeout
    ::timeotus::timeouts
    ::tiemouts::timeouts
    ::itmeouts::timeouts
    ::tiemr::timer
    ::itmer::timer
    ::tiemrs::timers
    ::itmers::timers
    :*:tiemstamp::timestamp         ; timestamp/s/ed/er/ing
    :*:itmestamp::timestamp
    :*:timestmap::timestamp
    :C:ot a::to a
    :C:ot an::to an
    ::ot be::to be
    ::t obe::to be
    ::ot call::to call
    ::ot do::to do
    :C:TO do::To do
    :C:to od::to do
    ::t odo::to do
    ::ot find::to find
    ::ot get::to get
    ::t oget::to get
    ::ot give::to give
    ::ot go::to go
    ::to og::to go
    ::ot have::to have
    ::ot it::to it
    ::ot its::to its
    ::ot know::to know
    ::ot make::to make
    ::ot move::to move
    ::ot put::to put
    ::ot see::to see
    ::ot send::to send
    ::ot set::to set
    ::ot take::to take
    ::ot test::to test
    ::ot that::to that
    ::ot the::to the
    ::ot hte::to the                ; this rule and next do not work
    ::ot teh::to the
    ::to th::to the
    ::tothe::to the
    ::t othe::to the
    ::ot them::to them
    ::ot these::to these
    ::ot this::to this
    ::ot those::to those
    ::ot try::to try
    ::ot use::to use
    ::ot what::to what
    ::ot which::to which
    ::ot work::to work
    ::ot you::to you
    ::ot your::to your
    ::todya::today
    ::tdoay::today
    ::togehter::together
    :*:toekn::token                 ; token/s/ise/izer/isation
    :*:otekn::token
    ::tokne::token
    ::tokesn::tokens
    ::toknes::tokens
    ::tolerence::tolerance
    ::toelrance::tolerance
    ::tolerences::tolerances
    ::toelrances::tolerances
    ::toosl::tools
    ::toolsrip::toolstrip
    ::toplogical::topological
    ::topoloical::topological
    ::trakcs::tracks
    ::tractible::tractable
    ::trian::train
    ::trianer::trainer
    ::trianing::training
    ::trians::trains
    :*:trnas::trans                 ; transmit, transaction, transfer, transport, translation
    ::transcation::transaction
    ::transcations::transactions
    :*:transofrm::transform         ; transform/s/ed/ing/ation
    ::transfomer::transformer
    ::transiitive::transitive
    ::transiitively::transitively
    :*:transalte::translate         ; translate/d/s
    ::travling::traveling
    ::traeling::traveling
    ::traersal::traversal
    ::traversla::traversal
    ::traersals::traversals
    ::traverslas::traversals
    ::treee::tree
    ::treees::trees
    ::triaeg::triage
    ::trinagle::triangle
    ::triangel::triangle
    :*:tirgger::trigger             ; trigger/s/ed/ing
    :C:triger::trigger
    ::trigered::triggered
    ::trigering::triggering
    ::trigers::triggers
    ::trillino::trillion
    ::trillinos::trillions
    :C:TRue::True
    :*:ture;::true;
    ::trucate::truncate
    ::trucated::truncated
    ::trucates::truncates
    ::try ot::try to
    ::tuend::tuned
    ::tuens::tunes
    ::tupel::tuple
    ::twithc::twitch
    ::tyep::type
    ::tyepalias::typealias          ; Swift keyword
    ::tyepdef::typedef
    ::typenaem::typename
    ::tyepof::typeof
    ::tyeps::types
    ::tpyical::typical
    ::typcial::typical
    ::tpyically::typically
    ::typcially::typically

    ::undfeined::undefined
    ::undefiend::undefined
    :*:udner::under                 ; under/flow/neath/stand/whelm
    ::underwheml::underwhelm
    ::uniofrmly::uniformly
    ::uniformotuput::uniformoutput  ; MATLAB name/value pair
    ::unimporant::unimportant
    ::unoin::union
    ::uniqeu::unique
    ::unqiue::unique
    ::uniuqe::unique
    ::uniqe::unique
    ::uinque::unique
    ::uqniue::unique
    ::unqieu::unique
    ::unieu::unique
    ::uqnieu::unique
    ::uniqeuly::uniquely
    ::unqiuely::uniquely
    ::uniuqely::uniquely
    ::uinquely::uniquely
    ::uniqely::uniquely
    ::uqniuely::uniquely
    ::unqieuly::uniquely
    ::unieuly::uniquely
    ::uqnieuly::uniquely
    ::unittets::unittest            ; Python testing framework
    ::unviersal::universal
    ::unkonwn::unknown
    :*:unlokc::unlock               ; unlock/s/ed/ing
    ::unorderd::unordered
    ::unordrerd::unordered
    ::unorderd_map::unordered_map
    ::unordrerd_map::unordered_map
    ::unorderd_set::unordered_set
    ::unordrerd_set::unordered_set
    ::unraed::unread
    ::unsaef::unsafe
    ::unsfae::unsafe
    ::unsgined::unsigned
    ::unsigend::unsigned
    :*:unsrot::unsort               ; unsort/ed/ing/able
    :*:unosrt::unsort
    :*:unsorrt::unsort
    :*:unsubcribe::unsubscribe      ; unsubscribe/d/s
    ::unitl::until
    ::utnil::until
    ::unvisisted::unvisited
    :*:udpate::update               ; update/d/s/r
    :*:upadte::update
    :*:updadte::update
    ::udpating::updating
    ::upadting::updating
    ::updateing::updating
    :*:uploda::upload               ; upload/s/ed/er/ing
    ::upsream::upstream
    ::uesd::used
    ::used ot::used to
    ::uesr::user
    ::uesrname::username
    ::uesrs::users
    ::uinsg::using
    ::utitlities::utilities
    ::utilites::utilities
    ::utiltity::utility
    ::utitlity::utility

    ::vacnat::vacant
    ::vlaid::valid
    ::avlid::valid
    ::vlaidate::validate
    ::avlidate::validate
    ::vlaidated::validated
    ::avlidated::validated
    ::vlaidates::validates
    ::avlidates::validates
    ::valueable::valuable
    ::vlaue::value
    ::avlue::value
    ::vluae::value
    ::valeu::value
    ::vlue::value
    ::vaule::value
    ::vlaued::valued
    ::avlued::valued
    ::vluaed::valued
    ::valeud::valued
    ::vlued::valued
    ::vauled::valued
    ::vlaues::values
    ::avlues::values
    ::vluaes::values
    ::valeus::values
    ::vlues::values
    ::vaules::values
    ::vareiable::variable
    ::varibale::variable
    ::varible::variable
    ::vairable::variable
    ::variabel::variable
    ::vareiables::variables
    ::varibales::variables
    ::varibles::variables
    ::varaibles::variables
    ::vairables::variables
    ::variabels::variables
    ::varaidic::variadic
    ::variatn::variant
    ::variatns::variants
    ::vetor::vector
    ::vecotr::vector
    ::vetcor::vector
    ::vecctor::vector
    ::vctor::vector
    ::vectcor::vector
    :*:vectro<::vector<                 ; C++ dynamic array
    ::vetors::vectors
    ::vecotrs::vectors
    ::vetcors::vectors
    ::vecctors::vectors
    ::vctors::vectors
    ::vectcors::vectors
    ::veirfication::verification
    ::vierfication::verification
    ::veirfy::verify
    ::vierfy::verify
    ::verifiy::verify
    ::veriyf::verify
    ::vesrion::version
    ::veriosn::version
    ::verisno::version
    ::vesrioning::versioning
    ::veriosning::versioning
    ::verisnoing::versioning
    ::vesrions::versions
    ::veriosns::versions
    ::verisnos::versions
    ::vetex::vertex
    ::veritcal::vertical
    ::veritical::vertical
    ::vrey::very
    ::vidoe::video
    ::ivdeo::video
    ::vidoes::videos
    ::ivdeos::videos
    ::veiw::view
    ::veiwed::viewed
    ::viewr::viewer
    ::veiwer::viewer
    ::veiwing::viewing
    ::veiwport::viewport
    ::veiws::views
    ::vitual::virtual
    ::virutal::virtual
    ::virtula::virtual
    ::viisble::visible
    ::visibel::visible
    ::viisblity::visiblility
    :*:viist::visit                 ; visit/s, visitor/s
    ::visisted::visited
    :*:viusal::visual               ; visual/s/ly/ise/ize/ized/ization
    :*:visula::visual
    :C:VIsual::Visual               ; Visual Studio
    :*:visaul::visual
    ::visualiation::visualization
    ::visualiations::visualizations
    :C:vodi::void                   ; C data type
    :C:viod::void
    ::voluem::volume

    :C:wiat::wait
    ::wiated::waited
    ::wiating::waiting
    ::wiats::waits
    ::wkae::wake
    ::watn::want
    :C:wnat::want
    ::want ot::want to
    ::wnated::wanted
    ::watns::wants
    ::wnats::wants
    ::wanring::warning
    :C:wsa::was
    :C:WAs::Was
    ::wa snot::was not
    ::was nto::was not
    ::wans't::wasn't
    ::wan't::wasn't
    ::wasnt'::wasn't
    :*:wtach::watch                 ; watch/ed/es/dog/point
    :*:awtch::watch
    :C:wyas::ways
    ::weakesn::weakens
    :*:wieght::weight               ; weight/s/ed/ing
    ::wetn::went
    ::were nto::were not
    ::wern't::weren't
    ::werent'::weren't
    ::werne't::weren't
    ::whta::what
    ::hwat::what
    ::waht::what
    :C:WHat::What
    ::hwen::when
    ::wehn::when
    ::whne::when
    :C:WHen::When
    ::whe na::when a
    ::whe nan::when an
    ::whent he::when the
    ::whe nthe::when the
    ::whenver::whenever
    ::wehnever::whenever
    ::hwenever::whenever
    ::wehre::where
    :C:WHere::Where
    ::wheer::where
    ::whree::where
    ::werhe::where
    ::wher eare::where are
    ::wher ethe::where the
    ::wher eyou::where you
    ::wehrever::wherever
    ::whreever::wherever
    ::wich::which
    ::hwich::which
    ::whihc::which
    ::hwihc::which
    ::whcih::which
    :C:WHich::Which
    ::wihch::which
    ::whicht he::which the
    ::whiel::while
    ::hwile::while
    ::whlie::while
    ::whlei::while
    ::wihle::while
    ::hwlie::while
    :C:WHile::While
    ::wihel::while
    ::hwiel::while
    :*:whle (::while (              ; while loop
    :*:whle(::while(
    :*:whtie::white                 ; whiteboard, whitelist, whitespace
    :*:whitelsit::whitelist         ; whitelist/s/ed/ing
    :C:WHo::Who
    ::whoaim::whoami
    ::whoel::whole
    ::hwose::whose
    :C:WHy::Why
    ::hwy it::why it
    ::hwy the::why the
    ::hwy they::why they
    ::hwy you::why you
    ::iwdth::width
    ::widht::width
    ::iwdths::widths
    ::widhts::widths
    ::iwll::will
    ::will nto::will not
    :*:winowd::window               ; window/s/ed/ing
    :*:winodw::window
    :*:iwndow::window
    ::iwth::with
    :C:wiht::with
    ::wtih::with
    :C:WIth::With
    :C:iwht::with
    ::witht he::with the
    ::wit hthe::with the
    ::wihtin::within
    ::iwthin::within
    ::wtihin::within
    ::iwhtin::within
    ::withotu::without
    ::iwthout::without
    ::wihtout::without
    ::wtihout::without
    ::iwhtout::without
    ::iwthotu::without
    ::wont'::won't
    ::wo'nt::won't
    ::own't::won't
    ::owrd::word
    :C:wrod::word
    ::owrding::wording
    ::wroding::wording
    ::owrds::words
    ::wrods::words
    :*:owrk::work                   ; workaround, worker, workflow
    :*:wokr::work
    ::workaorund::workaround
    ::wroker::worker
    ::workeres::workers
    ::wrokers::workers
    ::workflwo::workflow
    ::worklfow::workflow
    ::workflwos::workflows
    ::worklfows::workflows
    ::worht::worth
    ::woudl::would
    ::owuld::would
    ::would nto::would not
    ::wouldnt'::wouldn't
    ::woudln't::wouldn't
    :*:wirte::write                 ; write/r/s, Write-Output
    :*:wriet::write
    :*:wrtie::write
    ::wirting::writing
    ::wirtings::writings
    ::wirtten::written
    ::writen::written

    ::yaer::year
    ::yaers::years
    :*:yeidl::yield                 ; yield/s/ed/ing
    :*:yeild::yield
    :C:YOu::You
    :*:yoru::your                   ; your, yours, yourself
    :*:yuor::your
    ::youself::yourself

    :C:zeor::zero
    :C:zeors::zeros

    ; SUFFIX LIST
    ; Autocorrect words which have these endings.
    ; Useful suffix dictionary search tool: https://www.litscape.com/word_tools/ends_with.php)

    :C?:albe::able        ; ex: available, mutable, scalable, readable, variable
    :C?:aicng::acing      ; ex: spacing, tracing, replacing, placing, emplacing
    :C?:aegd::aged        ; ex: averaged, imaged, managed, packaged, triaged, paged
    :C?:aegs::ages        ; ex: languages, pages, messages, usages, outages, manages, averages
    :C?:gaes::ages
    :C?:ianed::ained      ; ex: contained, retained, trained, maintained, remained, chained, constrained
    :C?:aiend::ained
    :C?:aisn::ains        ; ex: remains, domains, trains, contains, chains
    :C?:kaes::akes        ; ex: makes, remakes, takes, wakes, stakes
    :C?:laize::alize      ; ex: equalize, initialize, normalize, visualize, serialize
    :C?:laized::alized
    :C?:laizes::alizes
    :C?:allly::ally       ; ex: automatically, finally, optionally, sporadically, computationally, dynamically
    :C?:alyl::ally
    :C?:laly::ally
    :C?:nace::ance        ; ex: balance, distance, finance, instance, tolerance, advance, enhance
    :C?:acne::ance
    :C?:naced::anced
    :C?:acned::anced
    :C?:naces::ances
    :C?:acnes::ances
    :C?:aenous::aneous    ; ex: simultaneous, extraneous, instantaneous, miscellaneous, spontaneous
    :C?:aenously::aneously
    :C?:raes::ares        ; ex: shares, declares, prepares, compares, squares
    :C?:airty::arity      ; ex: parity, modularity, similarity, linearity, popularity
    :C?:iarty::arity
    :C?:aesd::ased        ; ex: erased, based, increased, released, leased, aliased, chased
    :C?:aesr::aser        ; ex: eraser, increaser, releaser, purchaser, chaser
    :C?:aesrs::asers
    :C?:athc::atch        ; ex: catch, batch, match, watch, dispatch, patch
    :C?:aetd::ated        ; ex: emulated, obfuscated, encapsulated, updated, automated, related
    :C?:taed::ated
    :C?:aetly::ately      ; ex: accurately, moderately, approximately, immediately, ultimately, deliverately
    :C?:taion::ation      ; ex: application, optimization, relation, mutation, replication, deviation
    :C?:taoin::ation
    :C?:aotin::ation
    :C?:taional::ational  ; ex: relational, educational, operational, rational, observational
    :C?:taions::ations
    :C?:taoins::ations
    :C?:atie::ative       ; ex: native, collaborative, alternative, iterative, generative
    :C?:taive::ative
    :C?:atiely::atively
    :C?:taively::atively
    :C?:aitvely::atively
    :C?:atro::ator        ; ex: generator, emulator, operator, iterator, numerator, authenticator
    :C?:atros::ators
    :C?:bakc::back        ; ex: callback, playback, fallback, rollback, feedback
    :C?:bakcs::backs
    :C?:bilties::bilities ; ex: abilities, probabilities, availabilities, possibilities, capabilities
    :C?:blities::bilities
    :C?:bilites::bilities
    :C?:blites::bilities
    :C?:biilties::bilities
    :C?:bilty::bility     ; ex: scalability, ability, mutability, probability, stability, visibility, availability
    :C?:blity::bility
    :C?:ilbity::bility
    :C?:biilty::bility
    :C?:baord::board      ; ex: keyboard, clipboard, dashboard, motherboard, soundboard, leaderboard
    :C?:borad::board
    :C?:boadr::board
    :C?:baords::boards
    :C?:borads::boards
    :C?:csat::cast        ; ex: cast, upcast, downcast, broadcast, anycast, multicast
    :C?:csated::casted
    :C?:csats::casts
    :C?:caet::cate        ; ex: allocate, duplicate, authenticate, communicate, concatenate, replicate
    :C?:caets::cates
    :C?:ctaing::cating    ; ex: locating, replicating, preallocating, obfuscating, communicating
    :C?:caction::cation   ; ex: notification, replication, allocation, application, communication
    :C?:caion::cation
    :C?:cactions::cations
    :C?:caions::cations
    :C?:cesr::cers        ; ex: producers, sequencers, replacers, reducers, servicers
    :C?:hced::ched        ; ex: cached, fetched, glitched, batched, searched, launched
    :C?:hcer::cher        ; ex: cacher, fetcher, batcher, searcher, launcher
    :C?:hcers::chers
    :C?:hcing::ching      ; ex: caching, matching, touching, watching, launching
    :C?:hicng::ching
    :C?:ctiy::city        ; ex: capacity, opacity, scarcity, atomicity, multiplicity
    :C?:ciyt::city
    :C?:citiy::city
    :C?:kced::cked        ; ex: locked, unlocked, picked, stacked, checked, clicked, tracked
    :C?:kcer::cker        ; ex: locker, unlocker, picker, stacker, checker, clicker, tracker
    :C?:kcers::ckers
    :C?:kcet::cket        ; ex: ticket, packet, socket, bracket, racket
    :C?:kcets::ckets
    :C?:kcing::cking      ; ex: locking, tracking, networking, blocking, benchmarking, stacking
    :C?:clty::ctly        ; ex: abstractly, correctly, distinctly, perfectly, directly, strictly
    :C?:DAta::Data        ; ex: Data, newData, myData, oldData, prevData
    :C?:daet::date        ; ex: update, validate, invalidate, mandate, candidate
    :C?:daets::dates
    :C?:dadtion::dation   ; ex: recommendation, foundation, validation, invalidation, consolidation
    :C?:denet::dent       ; ex: independent, descendent, dependent, indent, resident, incedent
    :C?:detn::dent
    :C?:denets::dents
    :C?:detns::dents
    :C?:dres::ders        ; ex: encoders, transponders, leaders, providers, readers
    :C?:idng::ding        ; ex: offloading, finding, padding, coding, encoding, building, ascending
    :C?:indg::ding
    :C?:idngs::dings
    :C?:indgs::dings
    :C?:idtion::dition    ; ex: addition, condition, edition, tradition, precondition
    :C?:idtional::ditional
    :C?:idtionally::ditionally
    :C?:idtions::ditions
    :C?:donw::down        ; ex: down, markdown, shutdown, slowdown, teardown
    :C?:odwn::down
    :C?:dutc::duct        ; ex: product, conduct, byproduct, deduct, induct
    :C?:dutcion::duction  ; ex: production, introduction, reduction, deduction, induction
    :C?:dutcs::ducts
    :C?:aech::each        ; ex: each, reach, teach, breach, foreach
    :C?:leing::eling      ; ex: traveling, leveling, labeling, canceling, modeling
    :C?:necy::ency        ; ex: adjacency, consistency, frequency, dependency, latency
    :C?:enyc::ency
    :C?:edns::ends        ; ex: appends, extends, intends, suspends, depends, trends
    :C?:netion::ention    ; ex: attention, convention, contention, intention, mention, retention
    :C?:netions::entions
    :C?:netly::ently      ; ex: concurrently, efficiently, independently, sufficiently, subsequently
    :C?:oeus::eous        ; ex: simultaneous, miscellaneous, advantageous, erroneous, homogeneous
    :C?:oeusly::eously
    :C?:erla::eral        ; ex: general, literal, peripheral, ephemeral, several, numeral
    :C?:erlas::erals
    :C?:earting::erating  ; ex: accelerating, iterating, enumerating, generating, operating, decelearting
    :C?:ofrm::form        ; ex: platform, perform, transform, inform, uniform
    :C?:fomr::form
    :C?:ofmr::form
    :C?:ofrmed::formed
    :C?:fomred::formed
    :C?:ofmred::formed
    :C?:ofrmer::former
    :C?:fomrer::former
    :C?:ofmrer::former
    :C?:ofrmers::formers
    :C?:fomrers::formers
    :C?:ofmrers::formers
    :C?:ofrming::forming
    :C?:fomring::forming
    :C?:ofmring::forming
    :C?:ofrms::forms
    :C?:fomrs::forms
    :C?:ofmrs::forms
    :C?:gaion::gation     ; ex: aggregation, propagation, investigation, mitigation, negation
    :C?:gaions::gations
    :C?:getn::gent        ; ex: agent, intelligent, tangent, convergent, divergent, urgent
    :C?:getnly::gently
    :C?:garphy::graphy    ; ex: cryptography, photography, demography, typography, steganography
    :C?:grahpy::graphy

    :C?:aible::iable      ; ex: variable, reliable, satisfiable, specifiable, viable, modifiable
    :C?:ialy::ially       ; ex: sequentially, essentially, artificially, exponentially, partially, officially
    :C?:ailly::ially
    :C?:inat::iant        ; ex: variant, invariant, compliant, reliant, covariant
    :C?:aite::iate        ; ex: exponentiate, initiate, instantiate, immediate, associate
    :C?:aites::iates
    :C?:icla::ical        ; ex: topological, canonical, symmetrical, logical, lexical
    :C?:iaction::ication  ; ex: notification, replication, application, communication, classification
    :C?:iicent::icient    ; ex: efficient, deficient, coefficient, inefficient, sufficient
    :C?:iicently::iciently
    :C?:iecne::ience      ; ex: experience, science, patience, convenience, audience, resilience
    :C?:eince::ience
    :C?:iecnes::iences
    :C?:einces::iences
    :C?:ietn::ient        ; ex: gradient, quotient, client, transient, recipient, efficient, resilient
    :C?:ienet::ient
    :C?:eint::ient
    :C?:eitn::ient
    :C?:eintly::iently    ; ex: efficiently, conveniently, inefficiently, sufficiently, resiliently
    :C?:ietnly::iently
    :C?:ietns::ients
    :C?:ienets::ients
    :C?:eints::ients
    :C?:eitns::ients
    :C?:iifc::ific        ; ex: specific, prolific, terrific, unscientific, scientific
    :C?:iifed::ified      ; ex: specified, classified, simplified, verified, unified, identified
    :C?:iified::ified
    :C?:iifer::ifier      ; ex: specifier, classifier, simplifier, verifier, unifier, identifier
    :C?:iifier::ifier
    :C?:iifers::ifiers
    :C?:iifiers::ifiers
    :C?:iifes::ifies      ; ex: verifies, notifies, amplifies, justifies, magnifies
    :C?:iifies::ifies
    :C?:igth::ight        ; ex: height, weight, right, light, sight, eight, copyright
    :C?:ihgt::ight
    :C?:igths::ights
    :C?:ihgts::ights
    :C?:liity::ility      ; ex: probability, stability, feasibility, capability, utility
    :C?:iaml::imal        ; ex: decimal, optimal, maximal, minimal, proximal
    :C?:ianl::inal        ; ex: terminal, final, original, ordinal, marginal
    :C?:ienr::iner        ; ex: container, definer, combiner, chainer, joiner
    :C?:ienrs::iners
    :C?:ign::ing          ; ex: running, string, meaning, testing, working, learning, mapping
                          ; Note: see whitelist at the top for valid -ign words
    :C?:nig::ing
    :C?:igns::ings        ; Note: see whitelist at the top for valid -igns words
    :C?:nigs::ings
    :C?:oinal::ional      ; ex: conditional, optional, functional, rational, relational, computational
    :C?:ioanl::ional
    :C?:oinally::ionally
    :C?:ioanlly::ionally
    :C?:ouis::ious        ; ex: previous, various, dubious, suspicious, cautious
    :C?:oius::ious
    :C?:iosu::ious
    :C?:ouisly::iously    ; ex: previously, spuriously, obliviously, suspiciously, ambitiously
    :C?:oiusly::iously
    :C?:iosuly::iously
    :C?:riing::iring      ; ex: hiring, acquiring, impairing, requiring, retiring, pairing
    :C?:iesd::ised        ; ex: equalised, synchronised, amortised, randomised, memorised
    :C?:iesr::iser        ; ex: equaliser, synchroniser, amortiser, randomiser, memoriser
    :C?:iison::ision      ; ex: decision, collision, revision, division, elision
    :C?:iisons::isions
    :C?:iites::ities      ; ex: capabilities, quantities, capacities, probabilities, equalities, utilities
    :C?:tiies::ities
    :C?:tiing::iting      ; ex: waiting, writing, editing, limiting, visiting
    :C?:tiion::ition      ; ex: partition, definition, condition, position, transition
    :C?:tiioning::itioning
    :C?:tiions::itions
    :C?:tiive::itive      ; ex: positive, primitive, repetitive, transitive, additive
    :C?:tiively::itively
    :C?:tiives::itives
    :C?:ivley::ively      ; ex: relatively, actively, intrusively, recursively, productively
    :C?:iivty::ivity      ; ex: connectivity, sensitivity, productivity, activity, inactivity
    :C?:iviyt::ivity
    :C?:iezd::ized        ; ex: equalized, synchronized, amortized, randomized, memorized
    :C?:iezr::izer        ; ex: equalizer, synchronizer, amortizer, randomizer, memorizer
    :C?:iezrs::izers
    :C?:alble::lable      ; ex: available, callable, scalable, unscalable, calculable
    :C?:alyed::layed      ; ex: delayed, displayed, played, replayed, overlayed, relayed
    :C?:lnie::line        ; ex: online, offline, baseline, pipeline, timeline, newline, decline
    :C?:lnied::lined
    :C?:lnies::lines
    :C?:ltiy::lity        ; ex: probability, stability, quality, capability, utility, functionality
    :C?:liyt::lity
    :C?:litiy::lity
    :C?:lzie::lize        ; ex: initialize, serialize, visualize, normalize, utilize
    :C?:liez::lize
    :C?:lzied::lized
    :C?:lzier::lizer
    :C?:lelr::ller        ; ex: seller, caller, smaller, controller, teller
    :C?:laod::load        ; ex: overload, download, upload, workload, offload
    :C?:laoded::loaded
    :C?:laoder::loader
    :C?:laoding::loading
    :C?:laods::loads
    :C?:amrk::mark        ; ex: mark, benchmark, bookmark, checkmark, trademark
    :C?:mrak::mark
    :C?:amrked::marked
    :C?:mraked::marked
    :C?:amrking::marking
    :C?:mraking::marking
    :C?:amrks::marks
    :C?:mraks::marks
    :C?:amte::mate        ; ex: approximate, estimate, animate, automate, summate
    :C?:amted::mated
    :C?:amtes::mates
    :C?:maion::mation     ; ex: information, summation, automation, estimation, animation
    :C?:maions::mations
    :C?:menet::ment       ; ex: comment, argument, increment, element, environment, implement, augment
    :C?:emnt::ment
    :C?:emtn::ment
    :C?:metn::ment
    :C?:mnet::ment
    :C?:meent::ment
    :C?:meented::mented
    :C?:meneted::mented
    :C?:mneted::mented
    :C?:emnted::mented
    :C?:emnts::ments
    :C?:emtns::ments
    :C?:metns::ments
    :C?:menets::ments
    :C?:meents::ments
    :C?:mnets::ments
    :C?:mzie::mize        ; ex: customize, minimize, maximize, optimize, randomize
    :C?:mzied::mized
    :C?:mzier::mizer
    :C?:mzies::mizes

    :C?:ntae::nate        ; ex: concatenate, eliminate, alternate, coordinate, terminate
    :C?:naet::nate
    :C?:ntaes::nates
    :C?:naets::nates
    :C?:naion::nation     ; ex: combination, coordination, alternation, concatenation, designation, destination
    :C?:naions::nations
    :C?:nices::ncies      ; ex: dependencies, frequencies, agencies, currencies, latencies, emergencies
    :C?:nicng::ncing      ; ex: advancing, balancing, referencing, syncing, sequencing, influencing
    :C?:dned::nded        ; ex: appended, expanded, suspended, rounded, extended, responded
    :C?:dner::nder        ; ex: render, responder, surrender, under, extender, remainder, finder
    :C?:dners::nders
    :C?:dning::nding      ; ex: rendering, rounding, appending, binding, finding, sending
    :C?:ntiy::nity        ; ex: infinity, opportunity, sanity, vicinity, unity
    :C?:kning::nking      ; ex: linking, ranking, thinking, chunking, shrinking
    :C?:NOde::Node        ; ex: Node, TreeNode, ListNode, CurrentNode, GraphNode
    :C?:Ndoe::Node
    :C?:snive::nsive      ; ex: responsive, espensive, defensive, offensive, expansive, extensive
    :C?:tnation::ntation  ; ex: representation, orientation, segmentation, documentation, implementation
    :C?:tnations::ntations
    :C?:tned::nted        ; ex: counted, discounted, mounted, segmented, augmented
    :C?:okcs::ocks        ; ex: locks, unlocks, clocks, blocks, unblocks, mocks
    :C?:oitn::oint        ; ex: powerpoint, breakpoint, disjoint, watchpoint, checkpoint, midpoint
    :C?:iont::oint
    :C?:onit::oint
    :C?:oitns::oints
    :C?:ionts::oints
    :C?:onits::oints
    :C?:oekr::oker        ; ex: broker, evoker, invoker, looker, revoker, onlooker
    :C?:oend::oned        ; ex: cloned, conditioned, joined, partitioned, functioned
    :C?:roed::ored        ; ex: monitored, stored, factored, explored, refactored
    :C?:oreis::ories      ; ex: respositories, accessories, factories, histories, theories, directories
    :C?:soed::osed        ; ex: closed, composed, enclosed, exposed, posed, supposed
    :C?:oudn::ound        ; ex: background, foreground, compound, sound, round
    :C?:oudns::ounds
    :C?:outn::ount        ; ex: count, account, amount, discount, mount
    :C?:outns::ounts
    :C?:oewr::ower        ; ex: follower, power, slower, lower, thrower, borrower
    :C?:oewrs::owers
    :C?:paeg::page        ; ex: page, homepage, webpage, stoppage, subpage
    :C?:opint::point      ; ex: midpoint, breakpoint, checkpoint, logpoint, powerpoint
    :C?:opints::points
    :C?:prot::port        ; ex: import, export, support, transport, report
    :C?:proted::ported
    :C?:proter::porter
    :C?:proters::porters
    :C?:prots::ports
    :C?:opse::pose        ; ex: compose, expose, purpose, repurpose, transpose
    :C?:pepr::pper        ; ex: stepper, wrapper, upper, swapper, cropper
    :C?:tped::pted        ; ex: accepted, adapted, scripted, encrypted, decrypted, interrupted
    :C?:tpion::ption      ; ex: exception, adoption, caption, option, reception
    :C?:tpions::ptions
    :C?:tpive::ptive      ; ex: adaptive, descriptive, receptive, disruptive, perceptive
    :C?:raeg::rage        ; ex: coverage, average, storage, leverage, overage
    :C?:rnat::rant        ; ex: grant, entrant, reentrant, quadrant, tolerant
    :C?:rnats::rants
    :C?:raet::rate        ; ex: enumerate, migrate, integrate, generate, iterate
    :C?:raets::rates
    :C?:retn::rent        ; ex: apparent, different, parent, inherent, current
    :C?:retnly::rently
    :C?:rila::rial        ; ex: material, adversarial, factorial, combinatorial, serial
    :C?:irng::ring        ; ex: refactoring, clustering, string, rendering, engineering, monitoring, filtering
    :C?:irngs::rings
    :C?:rtiy::rity        ; ex: security, priority, parity, integrity, modularity, similarity
    :C?:ritiy::rity
    :C?:riyt::rity
    :C?:rekd::rked        ; ex: marked, worked, benchmarked, bookmarked, checkmarked, sparked
    :C?:remd::rmed        ; ex: performed, alarmed, confirmed, transformed, formed
    :C?:rvoe::rove        ; ex: improve, approve, prove, disprove, drove
    :C?:rvoed::roved
    :C?:rvoes::roves
    :C?:saeg::sage        ; ex: message, usage, misusage, myMessage, passage
    :C?:sehd::shed        ; ex: distinguished, flushed, pushed, published, finished, established
    :C?:shesd::shed
    :C?:hsed::shed
    :C?:hsing::shing      ; ex: refreshing, publishing, hashing, smashing, flushing
    :C?:sihp::ship        ; ex: relationship, ownership, spaceship (operator), membership, leadership
    :C?:shpi::ship
    :C?:hsip::ship
    :C?:hspi::ship
    :C?:sihps::ships
    :C?:shpis::ships
    :C?:hsips::ships
    :C?:hspis::ships
    :C?:isde::side        ; ex: inside, outside, aside, beside, reside, upside, lookaside, reside
    :C?:isdes::sides
    :C?:sino::sion        ; ex: expression, recursion, comprehension, version, permission, dimension
    :C?:soin::sion
    :C?:oisn::sion
    :C?:soins::sions
    :C?:sinos::sions
    :C?:oisns::sions
    :C?:stiy::sity        ; ex: sparsity, necessity, diversity, intensity, falsity
    :C?:svie::sive        ; ex: recursive, expressive, permissive, inclusive, successive, exclusive
    :C?:sviely::sively
    :C?:isze::size        ; ex: resize, emphasize, organize, synthesize, downsize
    :C?:iszed::sized
    :C?:iszes::sizes
    :C?:srot::sort        ; ex: sort, mergesort, quicksort, heapsort, timsort
    :C?:osrt::sort
    :C?:sapce::space      ; ex: workspace, backspace, namespace, subspace, cyberspace, whitespace
    :C?:spcae::space
    :C?:psace::space
    :C?:sapces::spaces
    :C?:spcaes::spaces
    :C?:psaces::spaces
    :C?:sisng::ssing      ; ex: missing, processing, multiprocessing, assessing, addressing, bypassing
    :C?:issng::ssing
    :C?:sntat::stant      ; ex: constant, assistant, resistant, instant, distant, contestant
    :C?:sntats::stants
    :C?:tsed::sted        ; ex: nested, tested, rested, interested, posted, invested, listed
    :C?:setd::sted
    :C?:tsic::stic        ; ex: heuristic, statistic, deterministic, stochastic, logistic, elastic
    :C?:sitc::stic
    :C?:tsical::stical
    :C?:sitcal::stical
    :C?:tsics::stics
    :C?:sitcs::stics
    :C?:tsration::stration ; ex: orchestration, administration, demonstration, registration, illustration
    :C?:tsrations::strations
    :C?:STring::String    ; ex: String, myString, firstString, oldString, initialString

    :C?:taeg::tage        ; ex: advantage, shortage, outage, stage, percentage
    :C?:atlly::tally      ; ex: horizontally, vertically, digitally, totally, incrementally
    :C?:tnat::tant        ; ex: constant, important, instant, distant, inhabitant
    :C?:tatn::tant
    :C?:tnatly::tantly
    :C?:tatnly::tantly
    :C?:tnats::tants
    :C?:tatns::tants
    :C?:tayr::tary        ; ex: proprietary, commentary, complementary, documentary, elementary
    :C?:thces::tches      ; ex: catches, batches, switches, matches, glitches
    :C?:tley::tely        ; ex: approximately, accurately, remotely, completely, immediately
    :C?:tenet::tent       ; ex: persistent, content, existent, latent, consistent
    :C?:tesr::ters        ; ex: pointers, characters, routers, counters, computers, clusters
    :C?:tehr::ther        ; ex: another, either, other, together, gather, farther
    :C?:itfy::tify        ; ex: identify, justify, notify, satisfy, certify, quantify, rectify
    :C?:ityf::tify
    :C?:tiyf::tify
    :C?:itme::time        ; ex: lifetime, realtime, uptime, downtime, runtime, anytime
    :C?:tiem::time
    :C?:itmes::times
    :C?:tiems::times
    :C?:tien::tine        ; ex: routine, coroutine, byzantine, subroutine, pristine
    :C?:tiens::tines
    :C?:itng::ting        ; ex: selecting, testing, printing, routing, collecting, computing
    :C?:iton::tion        ; ex: function, exception, condition, transaction, authentication, representation
    :C?:tino::tion
    :C?:toin::tion
    :C?:iotn::tion
    :C?:itno::tion
    :C?:itonal::tional    ; ex: optional, functional, positional, conditional, operational
    :C?:itnoal::tional
    :C?:tinoal::tional
    :C?:itonally::tionally ; ex: directionally, functionally, positionally, conditionally, optionally
    :C?:itnoally::tionally
    :C?:tinoally::tionally
    :C?:itons::tions
    :C?:tinos::tions
    :C?:toins::tions
    :C?:iotns::tions
    :C?:tiosn::tions
    :C?:itnos::tions
    :C?:otins::tions
    :C?:tvie::tive        ; ex: objective, active, relative, effective, primitive, altnerative
    :C?:tviely::tively
    :C?:tvies::tives
    :C?:otry::tory        ; ex: directory, factory, history, inventory, repository, mandatory
    :C?:otyr::tory
    :C?:tetd::tted        ; ex: permitted, alotted, plotted, submitted, formatted, emitted
    :C?:taul::tual        ; ex: actual, eventual, conceptual, mutual, virtual, textual
    :C?:taully::tually
    :C?:tuer::ture        ; ex: feature, picture, future, structure, capture, mature
    :C?:utre::ture
    :C?:tuerd::tured
    :C?:utred::tured
    :C?:tuers::tures
    :C?:utres::tures
    :C?:ualr::ular        ; ex: modular, regular, tabular, granular, singular, angular
    :C?:luar::ular
    :C?:ullly::ully       ; ex: successfully, carefully, restfully, watchfully, skillfully
    :C?:ulyl::ully
    :C?:utls::ults        ; ex: results, testResults, defaults, faults, segfaults
    :C?:rued::ured        ; ex: captured, structured, featured, measured, configured, secured
    :C?:tued::uted        ; ex: executed, permuted, contributed, distributed, computed
    :C?:tues::utes        ; ex: executes, attributes, routes, computes, permutes
    :C?:tuing::uting      ; ex: computing, executing, routing, rerouting, attributing, contributing
    :C?:tuion::ution      ; ex: execution, resolution, solution, distribution, contribution
    :C?:tuions::utions
    :C?:Vlaue::Value      ; ex: Value, myValue, keyValue, maxValue, firstValue, initialValue
    :C?:Vluae::Value
    :C?:Valeu::Value
    :C?:Vaule::Value
    :C?:Vlaues::Values
    :C?:Vluaes::Values
    :C?:Valeus::Values
    :C?:Vaules::Values
    :C?:avte::vate        ; ex: derivate, private, activate, deactivate, motivate, innovate
    :C?:vaet::vate
    :C?:avted::vated
    :C?:avtes::vates
    :C?:vaets::vates
    :C?:vesr::vers        ; ex: servers, drivers, receivers, observers, solvers, delivers
    :C?:veyr::very        ; ex: very, every, delivery, discovery, recovery
    :C?:verey::very
    :C?:vtiy::vity        ; ex: activity, connectivity, sensitivity, productivity, relativity
    :C?:wrae::ware        ; ex: software, hardware, shareware, firmware, courseware
    :C?:awre::ware
    :C?:waer::ware
    :C?:hwere::where      ; ex: where, nowhere, somewhere, everywhere, anywhere
    :C?:iwng::wing        ; ex: viewing, reviewing, flowing, drawing, skewing, growing
    :C?:iwngs::wings
    :C?:owrk::work        ; ex: work, network, framework, rework, coursework
    :C?:wokr::work
    :C?:owrking::working
    :C?:wokring::working
    :C?:owrks::works
    :C?:wokrs::works
#HotIf
