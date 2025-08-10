#Requires AutoHotkey v2
; AHK v1 and Espanso are also supported, see https://github.com/tnear/AutocorrectForDevelopers
#SingleInstance Force

; INTRODUCTION
; AutocorrectForDevelopers is an AutoHotkey script which automatically fixes typos
; using rules tailored for software developers. The script's rules contain many
; corrections for common developer words involving keywords, classes, methods,
; programming languages, and software engineering concepts.
; The latest version is located here: https://github.com/tnear/AutocorrectForDevelopers

; AHK INFORMATION
; Hotstrings: https://www.autohotkey.com/docs/v2/Hotstrings.htm
; :C: = Match case.
; :*: = Ending char not required. Often added to encompass substrings.
;       For example, this rule -> :*:ansewr::answer
;       ...will convert 'ansewr' -> 'answer' before typing an ending character.
;       This lets it match 'answer', 'answers', 'answered', ...
; :?: = matches inside other words used for suffixes, ex, :?:tign::ting => testign -> testing.
;       The '?' option requires an ending character to trigger.
; Useful dictionary search tools:
;   Prefix: https://www.litscape.com/word_tools/starts_with.php
;   Suffix: https://www.litscape.com/word_tools/ends_with.php
; Contains: https://www.litscape.com/word_tools/contains_sequence.php

; END CHARACTERS
; The line below add these characters to the supported ending characters:
;   - '<' and '>' are useful for C++ templates
;   - '*' for pointers
;   - '`' for Markdown (note: backtick must be escaped as '``')
;   - '=' for comparisons
;   - '&' for AND expressions
;   - '|' for OR expressions
;   - '_' for snake_case
; Note: all other EndChars characters below are default AHK end characters:
#Hotstring EndChars -()[]{}:;'"/\,.?!`n `t<>*``=&|_+@#

; AHK VERSION 1 vs. VERSION 2
; Relevant AutocorrectForDevelopers v1 <=> v2 differences:
; Directives: #HotIf (v2) is #If (v1)
; For literal colons, each colon needs to be escaped in v2
; For example, to encode '::', escape each colon --> `:`:
;     For v1, use only one '`' to escape double colon --> `::

; AUTOCORRECT SCRIPT
; Exclude AHK script from MS Word because it already has autocorrect
; (although MS Word doesn't emphasize programming words).
; Note: this conditional can be changed to include or exclude other applications.
#HotIf !WinActive('ahk_exe WINWORD.exe')

    ; WHITELIST
    ; Whitelist these words by setting backspace to zero (b0).

    ; -abel word suffix whitelist (do not convert these to -able)
    :b0:abel::
    :b0:babel::
    :b0:cabel::
    :b0:fabel::
    :b0:gabel::
    :b0:kabel::
    :?b0:label:: ; the '?' char permits 'label' to appear in any suffix, ex: 'myLabel'
    :b0:mabel::
    :b0:nabel::
    :b0:sabel::
    :b0:zabel::

    ; -abels word suffix whitelist (do not convert these to -ables)
    :b0:abels::
    :b0:kabels::
    :?b0:labels:: ; the '?' char permits 'labels' to appear in any suffix, ex: 'myLabels'

    ; -atro word suffix whitelist (do not convert these to -ator)
    :b0:atro::
    :b0:cuatro::
    :b0:balatro::

    ; -dign word suffix whitelist (do not convert these to -ding)
    :b0:dign::
    :b0:condign::

    ; -dner word suffix whitelist (do not convert these to -nder)
    :b0:dner::
    :b0:gardner::

    ; -dners word suffix whitelist (do not convert these to -nders)
    :b0:dners::
    :b0:gardners::

    ; -eend word suffix whitelist (do not convert these to -ened)
    :b0:eend::
    :b0:neend::

    ; -eint word suffix whitelist (do not convert these to -ient)
    :b0:eint::
    :b0:feint::

    ; -ilbe word suffix whitelist (do not convert these to -ible)
    :b0:ilbe::
    :b0:silbe::
    :b0:tilbe::

    ; -laize word suffix whitelist (do not convert these to -alize)
    :b0:laize::
    :b0:formulaize::

    ; -lign word suffix whitelist (do not convert these to -ling)
    :b0:lign::
    :b0:align::
    :b0:disalign::
    :b0:malign::
    :b0:misalign::
    :b0:realign::
    :b0:unalign::

    ; -ligns word suffix whitelist (do not convert these to -lings)
    :b0:ligns::
    :b0:aligns::
    :b0:disaligns::
    :b0:maligns::
    :b0:misaligns::
    :b0:realigns::
    :b0:unaligns::

    ; -nace word suffix whitelist (do not convert these to -ance)
    :b0:nace::
    :b0:furnace::
    :b0:menace::

    ; -naces word suffix whitelist (do not convert these to -ances)
    :b0:naces::
    :b0:furnaces::
    :b0:menaces::

    ; -nign word suffix whitelist (do not convert these to -ning)
    :b0:nign::
    :b0:benign::
    :b0:unbenign::

    ; -otry word suffix whitelist (do not convert these to -tory)
    :b0:otry::
    :b0:bigotry::
    :b0:harlotry::
    :b0:quixotry::
    :b0:zealotry::

    ; -ouis word suffix whitelist (do not convert these to -ious)
    :b0:ouis::
    :b0:louis::

    ; -raes word suffix whitelist (do not convert these to -ares)
    :b0:raes::
    :b0:vertebraes::

    ; -roed word suffix whitelist (do not convert these to -ored)
    :b0:roed::
    :b0:rezeroed::
    :b0:zeroed::

    ; -rued word suffix whitelist (do not convert these to -ured)
    :b0:rued::
    :b0:accrued::
    :b0:construed::
    :b0:misconstrued::
    :b0:unaccrued::

    ; -sino word suffix whitelist (do not convert these to -sion)
    :b0:sino::
    :b0:casino::

    ; -sinos word suffix whitelist (do not convert these to -sions)
    :b0:sinos::
    :b0:casinos::

    ; -soed word suffix whitelist (do not convert these to -osed)
    :b0:soed::
    :b0:lassoed::

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
    :b0:fortino::

    ; -tinos word suffix whitelist (do not convert these to -tions)
    :b0:tinos::
    :b0:constantinos::
    :b0:cupertinos::
    :b0:latinos::
    :b0:valentinos::
    :b0:florentinos::
    :b0:sabatinos::
    :b0:fortinos::

    ; -tning word suffix whitelist (do not convert these to -nting)
    :b0:tning::
    :b0:lightning::

    ; -tsing word suffix whitelist (do not convert these to -sting)
    :b0:tsing::
    :b0:atsing::
    :b0:itsing::
    :b0:otsing::

    ; -tued word suffix whitelist (do not convert these to -uted)
    :b0:tued::
    :b0:statued::

    ; whitelist suffixes (only autocorrect these when they appear as suffixes, see bottom of script)
    :b0:abyl::         ; do not convert this string to -ably
    :b0:acne::         ; do not convert this string to -ance
    :b0:acned::        ; do not convert this string to -anced
    :b0:acner::        ; do not convert this string to -ancer
    :b0:acnes::        ; do not convert this string to -ances
    :b0:aegd::         ; do not convert this string to -aged
    :b0:aesd::         ; do not convert this string to -ased
    :b0:aetd::         ; do not convert this string to -ated
    :b0:aetly::        ; do not convert this string to -ately
    :b0:aible::        ; do not convert this string to -iable
    :b0:aiend::        ; do not convert this string to -ained
    :b0:airty::        ; do not convert this string to -arity
    :b0:aisn::         ; do not convert this string to -ains
    :b0:aitvely::      ; do not convert this string to -atively
    :b0:akcs::         ; do not convert this string to -acks
    :b0:albe::         ; do not convert this string to -able
    :b0:albes::        ; do not convert this string to -ables
    :b0:alble::        ; do not convert this string to -lable
    :b0:alyed::        ; do not convert this string to -layed
    :b0:alyl::         ; do not convert this string to -ally
    :b0:amtes::        ; do not convert this string to -mates
    :b0:anlly::        ; do not convert this string to -nally
    :b0:aotin::        ; do not convert this string to -ation
    :b0:aotr::         ; do not convert this string to -ator
    :b0:aotrs::        ; do not convert this string to -ators
    :b0:athc::         ; do not convert this string to -atch
    :b0:atiely::       ; do not convert this string to -atively
    :b0:atros::        ; do not convert this string to -ators
    :b0:avte::         ; do not convert this string to -vate
    :b0:avted::        ; do not convert this string to -vated
    :b0:avtes::        ; do not convert this string to -vates
    :b0:awre::         ; do not convert this string to -ware

    :b0:besr::         ; do not convert this string to -bers
    :b0:bgin::         ; do not convert this string to -bing
    :b0:bign::         ; do not convert this string to -bing
    :b0:biilties::     ; do not convert this string to -bilities
    :b0:biilty::       ; do not convert this string to -bility
    :b0:bilites::      ; do not convert this string to -bilities
    :b0:bilties::      ; do not convert this string to -bilities
    :b0:bilty::        ; do not convert this string to -bility
    :b0:blites::       ; do not convert this string to -bilities
    :b0:blities::      ; do not convert this string to -bilities
    :b0:blity::        ; do not convert this string to -bility
    :b0:bnig::         ; do not convert this string to -bing
    :b0:borad::        ; do not convert this string to -board

    :b0:caction::      ; do not convert this string to -cation
    :b0:cactions::     ; do not convert this string to -cations
    :b0:caet::         ; do not convert this string to -cate
    :b0:caets::        ; do not convert this string to -cates
    :b0:caion::        ; do not convert this string to -cation
    :b0:caions::       ; do not convert this string to -cations
    :b0:catsion::      ; do not convert this string to -cation
    :b0:catsions::     ; do not convert this string to -cations
    :b0:cekr::         ; do not convert this string to -cker
    :b0:cekrs::        ; do not convert this string to -ckers
    :b0:cesr::         ; do not convert this string to -cers
    :b0:cgin::         ; do not convert this string to -cing
    :b0:cign::         ; do not convert this string to -cing
    :b0:ckte::         ; do not convert this string to -cket
    :b0:cktes::        ; do not convert this string to -ckets
    :b0:clty::         ; do not convert this string to -ctly
    :b0:cnig::         ; do not convert this string to -cing
    :b0:csat::         ; do not convert this string to -cast
    :b0:ctaing::       ; do not convert this string to -cating

    :b0:dadtion::      ; do not convert this string to -dation
    :b0:daet::         ; do not convert this string to -date
    :b0:denet::        ; do not convert this string to -dent
    :b0:denets::       ; do not convert this string to -dents
    :b0:desr::         ; do not convert this string to -ders
    :b0:detn::         ; do not convert this string to -dent
    :b0:dned::         ; do not convert this string to -nded
    :b0:dnig::         ; do not convert this string to -ding
    :b0:dnigs::        ; do not convert this string to -dings
    :b0:dning::        ; do not convert this string to -nding

    :b0:ecne::         ; do not convert this string to -ence
    :b0:ecnes::        ; do not convert this string to -ences
    :b0:ecny::         ; do not convert this string to -ency
    :b0:eince::        ; do not convert this string to -ience
    :b0:einces::       ; do not convert this string to -iences
    :b0:einr::         ; do not convert this string to -iner
    :b0:einrs::        ; do not convert this string to -iners
    :b0:eintly::       ; do not convert this string to -iently
    :b0:eints::        ; do not convert this string to -ients
    :b0:eitn::         ; do not convert this string to -ient
    :b0:eitns::        ; do not convert this string to -ients
    :b0:emnt::         ; do not convert this string to -ment
    :b0:emnted::       ; do not convert this string to -mented
    :b0:emnting::      ; do not convert this string to -menting
    :b0:emnts::        ; do not convert this string to -ments
    :b0:emtn::         ; do not convert this string to -ment
    :b0:emtns::        ; do not convert this string to -ments
    :b0:enyc::         ; do not convert this string to -ency
    :b0:eond::         ; do not convert this string to -oned
    :b0:eprs::         ; do not convert this string to -pers
    :b0:erla::         ; do not convert this string to -eral
    :b0:erlas::        ; do not convert this string to -erals
    :b0:etns::         ; do not convert this string to -ents

    :b0:fiies::        ; do not convert this string to -ifies
    :b0:fomr::         ; do not convert this string to -form

    :b0:gaes::         ; do not convert this string to -ages
    :b0:gaion::        ; do not convert this string to -gation
    :b0:gaions::       ; do not convert this string to -gations
    :b0:garphy::       ; do not convert this string to -graphy
    :b0:getn::         ; do not convert this string to -gent
    :b0:gign::         ; do not convert this string to -ging
    :b0:gnig::         ; do not convert this string to -ging

    :b0:hcable::       ; do not convert this string to -chable
    :b0:hced::         ; do not convert this string to -ched
    :b0:hcer::         ; do not convert this string to -cher
    :b0:hcers::        ; do not convert this string to -chers
    :b0:hces::         ; do not convert this string to -ches
    :b0:hcing::        ; do not convert this string to -ching
    :b0:hgin::         ; do not convert this string to -hing
    :b0:hicng::        ; do not convert this string to -ching
    :b0:hign::         ; do not convert this string to -hing
    :b0:hnig::         ; do not convert this string to -hing
    :b0:hses::         ; do not convert this string to -shes
    :b0:hsing::        ; do not convert this string to -shing

    :b0:iaction::      ; do not convert this string to -ication
    :b0:ialy::         ; do not convert this string to -ially
    :b0:ianed::        ; do not convert this string to -ained
    :b0:icla::         ; do not convert this string to -ical
    :b0:idng::         ; do not convert this string to -ding
    :b0:idngs::        ; do not convert this string to -dings
    :b0:ienet::        ; do not convert this string to -ient
    :b0:ienets::       ; do not convert this string to -ients
    :b0:ienr::         ; do not convert this string to -iner
    :b0:ienrs::        ; do not convert this string to -iners
    :b0:iesd::         ; do not convert this string to -ised
    :b0:iesr::         ; do not convert this string to -iser
    :b0:ietn::         ; do not convert this string to -ient
    :b0:ietnly::       ; do not convert this string to -iently
    :b0:iezd::         ; do not convert this string to -ized
    :b0:ifeid::        ; do not convert this string to -ified
    :b0:igth::         ; do not convert this string to -ight
    :b0:igths::        ; do not convert this string to -ights
    :b0:ihgt::         ; do not convert this string to -ight
    :b0:ihgts::        ; do not convert this string to -ights
    :b0:iicent::       ; do not convert this string to -icient
    :b0:iicently::     ; do not convert this string to -iciently
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
    :b0:ilbity::       ; do not convert this string to -bility
    :b0:ilng::         ; do not convert this string to -ling
    :b0:ilngs::        ; do not convert this string to -lings
    :b0:imte::         ; do not convert this string to -time
    :b0:imtes::        ; do not convert this string to -times
    :b0:inat::         ; do not convert this string to -iant
    :b0:indg::         ; do not convert this string to -ding
    :b0:indgs::        ; do not convert this string to -dings
    :b0:insg::         ; do not convert this string to -sing
    :b0:ioanl::        ; do not convert this string to -ional
    :b0:ioanls::       ; do not convert this string to -ionals
    :b0:iont::         ; do not convert this string to -oint
    :b0:ionts::        ; do not convert this string to -oints
    :b0:iosn::         ; do not convert this string to -ions
    :b0:iosu::         ; do not convert this string to -ious
    :b0:iosuly::       ; do not convert this string to -iously
    :b0:iotn::         ; do not convert this string to -tion
    :b0:iotns::        ; do not convert this string to -tions
    :b0:isde::         ; do not convert this string to -side
    :b0:isdes::        ; do not convert this string to -sides
    :b0:isng::         ; do not convert this string to -sing
    :b0:issng::        ; do not convert this string to -ssing
    :b0:itaon::        ; do not convert this string to -ation
    :b0:itaons::       ; do not convert this string to -ations
    :b0:itfy::         ; do not convert this string to -tify
    :b0:itme::         ; do not convert this string to -time or -item
    :b0:itmes::        ; do not convert this string to -times or -items
    :b0:itng::         ; do not convert this string to -ting
    :b0:itnoal::       ; do not convert this string to -tional
    :b0:itnoally::     ; do not convert this string to -tionally
    :b0:itnos::        ; do not convert this string to -tions
    :b0:iton::         ; do not convert this string to -tion
    :b0:itonal::       ; do not convert this string to -tional
    :b0:itonally::     ; do not convert this string to -tionally
    :b0:itons::        ; do not convert this string to -tions
    :b0:ityf::         ; do not convert this string to -tify
    :b0:ivley::        ; do not convert this string to -ively
    :b0:ivty::         ; do not convert this string to -vity

    :b0:kcable::       ; do not convert this string to -ckable
    :b0:kced::         ; do not convert this string to -cked
    :b0:kcer::         ; do not convert this string to -cker
    :b0:kcers::        ; do not convert this string to -ckers
    :b0:kcet::         ; do not convert this string to -cket
    :b0:kcets::        ; do not convert this string to -ckets
    :b0:kcing::        ; do not convert this string to -cking
    :b0:kgin::         ; do not convert this string to -king
    :b0:kign::         ; do not convert this string to -king
    :b0:knig::         ; do not convert this string to -king
    :b0:kning::        ; do not convert this string to -nking

    :b0:laet::         ; do not convert this string to -late
    :b0:laets::        ; do not convert this string to -lates
    :b0:laized::       ; do not convert this string to -alized
    :b0:laizes::       ; do not convert this string to -alizes
    :b0:laly::         ; do not convert this string to -ally
    :b0:leing::        ; do not convert this string to -eling
    :b0:leld::         ; do not convert this string to -lled
    :b0:lelr::         ; do not convert this string to -ller
    :b0:lgin::         ; do not convert this string to -ling
    :b0:lgins::        ; do not convert this string to -lings
    :b0:liez::         ; do not convert this string to -lize
    :b0:liity::        ; do not convert this string to -ility
    :b0:litiy::        ; do not convert this string to -lity
    :b0:liyt::         ; do not convert this string to -lity
    :b0:lnie::         ; do not convert this string to -line
    :b0:lnig::         ; do not convert this string to -ling
    :b0:lnigs::        ; do not convert this string to -lings
    :b0:loyg::         ; do not convert this string to -logy
    :b0:ltiy::         ; do not convert this string to -lity
    :b0:luar::         ; do not convert this string to -ular
    :b0:lzie::         ; do not convert this string to -lize
    :b0:lzied::        ; do not convert this string to -lized
    :b0:lzier::        ; do not convert this string to -lizer

    :b0:maion::        ; do not convert this string to -mation
    :b0:maions::       ; do not convert this string to -mations
    :b0:meent::        ; do not convert this string to -ment
    :b0:meented::      ; do not convert this string to -mented
    :b0:meenting::     ; do not convert this string to -menting
    :b0:meents::       ; do not convert this string to -ments
    :b0:menet::        ; do not convert this string to -ment
    :b0:meneted::      ; do not convert this string to -mented
    :b0:meneting::     ; do not convert this string to -menting
    :b0:menets::       ; do not convert this string to -ments
    :b0:metn::         ; do not convert this string to -ment
    :b0:mgin::         ; do not convert this string to -ming
    :b0:mgins::        ; do not convert this string to -mings
    :b0:mign::         ; do not convert this string to -ming
    :b0:migns::        ; do not convert this string to -mings
    :b0:mnet::         ; do not convert this string to -ment
    :b0:mneted::       ; do not convert this string to -mented
    :b0:mneting::      ; do not convert this string to -menting
    :b0:mnets::        ; do not convert this string to -ments
    :b0:mnig::         ; do not convert this string to -ming
    :b0:mnigs::        ; do not convert this string to -mings
    :b0:msie::         ; do not convert this string to -mise
    :b0:msied::        ; do not convert this string to -mised
    :b0:msier::        ; do not convert this string to -miser
    :b0:msies::        ; do not convert this string to -mises
    :b0:mzie::         ; do not convert this string to -mize
    :b0:mzied::        ; do not convert this string to -mized
    :b0:mzier::        ; do not convert this string to -mizer
    :b0:mzies::        ; do not convert this string to -mizes

    :b0:nacer::        ; do not convert this string to -ancer
    :b0:naet::         ; do not convert this string to -nate
    :b0:naets::        ; do not convert this string to -nates
    :b0:necy::         ; do not convert this string to -ency
    :b0:netion::       ; do not convert this string to -ention
    :b0:netions::      ; do not convert this string to -entions
    :b0:ngins::        ; do not convert this string to -nings
    :b0:nices::        ; do not convert this string to -ncies
    :b0:nicng::        ; do not convert this string to -ncing
    :b0:nigns::        ; do not convert this string to -nings
    :b0:niing::        ; do not convert this string to -ining
    :b0:nnig::         ; do not convert this string to -ning
    :b0:nnigs::        ; do not convert this string to -nings
    :b0:noed::         ; do not convert this string to -oned
    :b0:ntae::         ; do not convert this string to -nate
    :b0:ntaes::        ; do not convert this string to -nates
    :b0:ntiy::         ; do not convert this string to -nity

    :b0:oend::         ; do not convert this string to -oned
    :b0:oeus::         ; do not convert this string to -eous
    :b0:oeusly::       ; do not convert this string to -eously
    :b0:oewr::         ; do not convert this string to -ower
    :b0:oewrs::        ; do not convert this string to -owers
    :b0:oinal::        ; do not convert this string to -ional
    :b0:oinally::      ; do not convert this string to -ionally
    :b0:oinals::       ; do not convert this string to -ionals
    :b0:oisn::         ; do not convert this string to -sion
    :b0:oisns::        ; do not convert this string to -sions
    :b0:oitn::         ; do not convert this string to -oint
    :b0:oitns::        ; do not convert this string to -oints
    :b0:oius::         ; do not convert this string to -ious
    :b0:oiusly::       ; do not convert this string to -iously
    :b0:okcs::         ; do not convert this string to -ocks
    :b0:onit::         ; do not convert this string to -oint
    :b0:onits::        ; do not convert this string to -oints
    :b0:opse::         ; do not convert this string to -pose
    :b0:oreis::        ; do not convert this string to -ories
    :b0:otins::        ; do not convert this string to -tions
    :b0:otyr::         ; do not convert this string to -tory
    :b0:oudn::         ; do not convert this string to -ound
    :b0:oudns::        ; do not convert this string to -ounds
    :b0:ouisly::       ; do not convert this string to -iously
    :b0:ousyl::        ; do not convert this string to -ously
    :b0:outn::         ; do not convert this string to -ount
    :b0:outns::        ; do not convert this string to -ounts

    :b0:petc::         ; do not convert this string to -pect
    :b0:prot::         ; do not convert this string to -port
    :b0:proted::       ; do not convert this string to -ported
    :b0:proter::       ; do not convert this string to -porter
    :b0:proters::      ; do not convert this string to -porters
    :b0:proting::      ; do not convert this string to -porting
    :b0:prots::        ; do not convert this string to -ports

    :b0:raeg::         ; do not convert this string to -rage
    :b0:raet::         ; do not convert this string to -rate
    :b0:ratn::         ; do not convert this string to -rant
    :b0:ratns::        ; do not convert this string to -rants
    :b0:remd::         ; do not convert this string to -rmed
    :b0:renet::        ; do not convert this string to -rent
    :b0:renetly::      ; do not convert this string to -rently
    :b0:retd::         ; do not convert this string to -rted
    :b0:retnly::       ; do not convert this string to -rently
    :b0:rgae::         ; do not convert this string to -rage
    :b0:riing::        ; do not convert this string to -iring
    :b0:ritiy::        ; do not convert this string to -rity
    :b0:riyt::         ; do not convert this string to -rity
    :b0:rnat::         ; do not convert this string to -rant
    :b0:rnats::        ; do not convert this string to -rants
    :b0:roies::        ; do not convert this string to -ories
    :b0:rtiy::         ; do not convert this string to -rity

    :b0:sehd::         ; do not convert this string to -shed
    :b0:setd::         ; do not convert this string to -sted
    :b0:shpi::         ; do not convert this string to -ship
    :b0:sitc::         ; do not convert this string to -stic
    :b0:sitcal::       ; do not convert this string to -stical
    :b0:sitcs::        ; do not convert this string to -stics
    :b0:snig::         ; do not convert this string to -sing
    :b0:snive::        ; do not convert this string to -nsive
    :b0:sntat::        ; do not convert this string to -stant
    :b0:sntats::       ; do not convert this string to -stants
    :b0:soin::         ; do not convert this string to -sion
    :b0:soins::        ; do not convert this string to -sions
    :b0:srues::        ; do not convert this string to -sures
    :b0:stisc::        ; do not convert this string to -stics
    :b0:stiy::         ; do not convert this string to -sity
    :b0:svie::         ; do not convert this string to -sive
    :b0:sviely::       ; do not convert this string to -sively

    :b0:taed::         ; do not convert this string to -ated
    :b0:taeg::         ; do not convert this string to -tage
    :b0:taely::        ; do not convert this string to -ately
    :b0:taion::        ; do not convert this string to -ation
    :b0:taional::      ; do not convert this string to -ational
    :b0:taions::       ; do not convert this string to -ations
    :b0:taive::        ; do not convert this string to -ative
    :b0:taively::      ; do not convert this string to -atively
    :b0:taoin::        ; do not convert this string to -ation
    :b0:taoins::       ; do not convert this string to -ations
    :b0:tatn::         ; do not convert this string to -tant
    :b0:tatnly::       ; do not convert this string to -tantly
    :b0:tatns::        ; do not convert this string to -tants
    :b0:taul::         ; do not convert this string to -tual
    :b0:taully::       ; do not convert this string to -tually
    :b0:tayr::         ; do not convert this string to -tary
    :b0:tcion::        ; do not convert this string to -ction
    :b0:tcions::       ; do not convert this string to -ctions
    :b0:tcor::         ; do not convert this string to -ctor
    :b0:tcors::        ; do not convert this string to -ctors
    :b0:tehr::         ; do not convert this string to -ther
    :b0:tenet::        ; do not convert this string to -tent
    :b0:tenetly::      ; do not convert this string to -tently
    :b0:tesr::         ; do not convert this string to -ters
    :b0:tetd::         ; do not convert this string to -tted
    :b0:tetr::         ; do not convert this string to -tter
    :b0:tetrs::        ; do not convert this string to -tters
    :b0:tgin::         ; do not convert this string to -ting
    :b0:tiem::         ; do not convert this string to -time
    :b0:tiems::        ; do not convert this string to -times
    :b0:tign::         ; do not convert this string to -ting
    :b0:tiies::        ; do not convert this string to -ities
    :b0:tiign::        ; do not convert this string to -iting
    :b0:tiing::        ; do not convert this string to -iting
    :b0:tiion::        ; do not convert this string to -ition
    :b0:tiioned::      ; do not convert this string to -itioned
    :b0:tiioning::     ; do not convert this string to -itioning
    :b0:tiions::       ; do not convert this string to -itions
    :b0:tiive::        ; do not convert this string to -itive
    :b0:tiively::      ; do not convert this string to -itively
    :b0:tiives::       ; do not convert this string to -itives
    :b0:tinoal::       ; do not convert this string to -tional
    :b0:tinoally::     ; do not convert this string to -tionally
    :b0:tiyf::         ; do not convert this string to -tify
    :b0:tnat::         ; do not convert this string to -tant
    :b0:tnation::      ; do not convert this string to -ntation
    :b0:tnations::     ; do not convert this string to -ntations
    :b0:tnatly::       ; do not convert this string to -tantly
    :b0:tnats::        ; do not convert this string to -tants
    :b0:tned::         ; do not convert this string to -nted
    :b0:tnig::         ; do not convert this string to -ting
    :b0:toin::         ; do not convert this string to -tion
    :b0:toins::        ; do not convert this string to -tions
    :b0:tped::         ; do not convert this string to -pted
    :b0:tpion::        ; do not convert this string to -ption
    :b0:tpions::       ; do not convert this string to -ptions
    :b0:tpive::        ; do not convert this string to -ptive
    :b0:tsed::         ; do not convert this string to -sted
    :b0:tsic::         ; do not convert this string to -stic
    :b0:tsical::       ; do not convert this string to -stical
    :b0:tsics::        ; do not convert this string to -stics
    :b0:tsration::     ; do not convert this string to -stration
    :b0:tsrations::    ; do not convert this string to -strations
    :b0:tuer::         ; do not convert this string to -ture
    :b0:tuers::        ; do not convert this string to -tures
    :b0:tuing::        ; do not convert this string to -uting
    :b0:tuion::        ; do not convert this string to -ution
    :b0:tuions::       ; do not convert this string to -utions
    :b0:tvie::         ; do not convert this string to -tive
    :b0:tviely::       ; do not convert this string to -tively
    :b0:tvies::        ; do not convert this string to -tives

    :b0:ualr::         ; do not convert this string to -ular
    :b0:uerd::         ; do not convert this string to -ured
    :b0:ullly::        ; do not convert this string to -ully
    :b0:ulyl::         ; do not convert this string to -ully
    :b0:uond::         ; do not convert this string to -ound
    :b0:uonds::        ; do not convert this string to -ounds
    :b0:usre::         ; do not convert this string to -sure
    :b0:usres::        ; do not convert this string to -sures
    :b0:utls::         ; do not convert this string to -ults
    :b0:utre::         ; do not convert this string to -ture
    :b0:utred::        ; do not convert this string to -tured
    :b0:utres::        ; do not convert this string to -tures

    :b0:vaet::         ; do not convert this string to -vate
    :b0:vaets::        ; do not convert this string to -vates
    :b0:vesr::         ; do not convert this string to -vers
    :b0:vgin::         ; do not convert this string to -ving
    :b0:vign::         ; do not convert this string to -ving
    :b0:viyt::         ; do not convert this string to -vity
    :b0:vnig::         ; do not convert this string to -ving
    :b0:vtiy::         ; do not convert this string to -vity

    :b0:waer::         ; do not convert this string to -ware
    :b0:wesr::         ; do not convert this string to -wers
    :b0:woed::         ; do not convert this string to -owed
    :b0:wrad::         ; do not convert this string to -ward
    :b0:wraded::       ; do not convert this string to -warded
    :b0:wrads::        ; do not convert this string to -wards
    :b0:wrae::         ; do not convert this string to -ware

    :b0:xgin::         ; do not convert this string to -xing
    :b0:xign::         ; do not convert this string to -xing
    :b0:xnig::         ; do not convert this string to -xing

    :b0:yfing::        ; do not convert this string to -fying
    :b0:ygin::         ; do not convert this string to -ying
    :b0:yign::         ; do not convert this string to -ying
    :b0:ynig::         ; do not convert this string to -ying

    :b0:zgin::         ; do not convert this string to -zing
    :b0:zign::         ; do not convert this string to -zing
    :b0:znig::         ; do not convert this string to -zing
    {
        ; see bottom of script for examples of these suffixes
    }

    ; PRIMARY AUTOCORRECT LIST
    ; Autocorrect these strings.
    ; Basic syntax -> ::oldString::newString

    :C:#Include::{#}include         ; directive in C/C++. '#' on RHS must be escaped by enclosing in '{}'
    :C:#Pragma::{#}pragma           ; directive in C/C++

    ::alot::a lot
    ::a lto::a lot
    :*:abbrevait::abbreviat         ; abbreviat/ed/es/ion
    ::abl eto::able to
    ::able ot::able to
    ::albe to::able to
    ::abotu::about
    ::aobut::about
    ::baout::about
    ::about ot::about to
    ::abvoe::above
    ::absoltue::absolute
    ::absoulte::absolute
    ::aboslute::absolute
    ::absoltuely::absolutely
    ::absoultely::absolutely
    ::aboslutely::absolutely
    :*:abstarct::abstract           ; abstract/s/ed/ion/ions
    :*:accetp::accept               ; accept/s/ed/ing/able/ance
    :*:accpet::accept
    :*:acceess::access
    ::accessibel::accessible
    ::accesible::accessible
    ::accessign::accessing
    ::accesing::accessing
    :*:accomodat::accommodat        ; accommodat/e/ed/es/ing
    ::accomplihs::accomplish
    ::according ot::according to
    :*:acount::account              ; account/s/ed/ing/able
    :*:accumualt::accumulat         ; accumulat/ed/es/or/ing
    :*:accumlat::accumulat
    ::accruacy::accuracy
    ::accurayc::accuracy
    ::accruate::accurate
    ::accuratley::accurately
    :*:ahciev::achiev               ; achiev/able/e/ed/es/ing/ement
    :*:acknwoledge::acknowledge     ; acknowledge/d/s/ment/ments
    :*:ackonwledge::acknowledge
    ::acqurie::acquire
    ::acqruie::acquire
    ::acqiure::acquire
    ::acquried::acquired
    ::acqruied::acquired
    ::acqiured::acquired
    ::acquries::acquires
    ::acqruies::acquires
    ::acqiures::acquires
    ::actula::actual
    ::acutal::actual
    ::adatper::adapter
    ::adatpers::adapters
    :*:adidtion::addition           ; addition/s/al/ally
    :*:adress::address              ; address/ed/es/ing/able
    :*:addreess::address
    ::addressign::addressing
    ::adjancecy::adjacency
    ::adjancency::adjacency
    ::adjacnet::adjacent
    ::adjancent::adjacent
    ::adjacenet::adjacent
    :*:ajdust::adjust               ; adjust/s/ed/er/ing/ment
    :*:adjsut::adjust
    ::adminstrator::administrator
    ::administator::administrator
    ::adminstrators::administrators
    ::administators::administrators
    ::admisn::admins
    :*:addvance::advance            ; advance/d/r/s
    :*:avdance::advance
    ::advnaced::advanced
    ::advnatage::advantage
    ::advnatages::advantages
    :*:adventru::adventur           ; adventur/e/ed/es/ing
    ::advisign::advising
    ::afetr::after
    ::agian::again
    ::agianst::against
    ::aginast::against
    ::agenet::agent
    :C:agnet::agent
    ::agenets::agents
    ::agnets::agents
    :*:agregat::aggregat            ; aggregat/e/ed/es/ion
    :*:aggreat::aggregat
    ::aehad::ahead
    :*:alamr::alarm                 ; alarm/s/ed/ing
    :*:laarm::alarm
    :*:algoirthm::algorithm         ; algorithm/s/ic
    :*:algorihtm::algorithm
    :*:algoirhtm::algorithm
    :*:algroithm::algorithm
    :*:algortihm::algorithm
    :*:algorhtm::algorithm
    :*:algorihm::algorithm
    :*:algorthm::algorithm
    :*:algorithim::algorithm
    ::algorithsm::algorithms
    ::alais::alias
    ::alaises::aliases
    ::aliasse::aliases
    ::aliasign::aliasing
    ::alaising::aliasing
    ::aligend::aligned
    :C:alvie::alive
    :*:alocat::allocat              ; allocat/e/ed/es/ing
    ::allcoate::allocate
    ::allcoated::allocated
    ::allcoates::allocates
    :C*:allwo::allow                ; allow/s/ed/ing/able. Case sensitive to avoid matches like 'allWords'
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
    ::althoguh::although
    ::alwasy::always
    ::alwyas::always
    :*:anayl::analy                 ; analy/se/ze/sis/tics
    ::anchro::anchor
    ::anchros::anchors
    :C:adn::and
    :C:Adn::And
    :C:nad::and
    :C:ANd::And
    :C:an dit::and it
    ::andthe::and the
    ::announcment::announcement
    ::announcments::announcements
    ::antoehr::another
    ::antoher::another
    :*:ansewr::answer               ; answer/s/ed/ing
    :*:naswer::answer
    ::anyoen::anyone
    ::anhyting::anything
    ::anyhting::anything
    ::anhything::anything
    ::anytyhing::anything
    ::anyhthing::anything
    ::antyhing::anything
    ::anywya::anyway
    ::apparnetly::apparently
    :*:appaer::appear               ; appear/s/ed/ance
    ::apperas::appears
    ::appedn::append
    ::appication::application
    ::appilcation::application
    ::aplication::application
    ::applicaton::application
    ::applciation::application
    ::appications::applications
    ::appilcations::applications
    ::aplications::applications
    ::applicatons::applications
    ::applciations::applications
    ::appleid::applied
    ::appleis::applies
    :*:apporach::approach           ; approach/ed/es/ing
    :*:aproach::approach
    :*:appraoch::approach
    :*:approahc::approach
    ::appropraite::appropriate
    ::appropraitely::appropriately
    ::apprvoe::approve
    ::apprvoed::approved
    ::apprvoes::approves
    ::approximatley::approximately
    ::arbitrayr::arbitrary
    ::architecturla::architectural
    ::archtiecture::architecture
    ::architectrue::architecture
    :*:archvie::archive             ; archive/d/r/s
    :C:ARe::Are
    ::are nto::are not
    ::are ont::are not
    ::arne't::aren't
    ::arent'::aren't
    ::arn'et::aren't
    ::are'nt::aren't
    ::arugment::argument
    ::arguement::argument
    ::arguent::argument
    ::arugments::arguments
    ::arguements::arguments
    ::arguents::arguments
    ::arisign::arising
    ::arithemtic::arithmetic
    ::aorund::around
    :*:arragn::arrang               ; arrang/e/ed/es/ing/ement
    :C:aray::array
    :*:arary::array                 ; array/s/ed/fun
    :*:arrray::array
    :C:ArayList::ArrayList          ; Java resizable array
    ::arays::arrays
    ::artifcat::artifact
    ::artificat::artifact
    ::artifcats::artifacts
    ::artificats::artifacts
    ::artifiical::artificial
    ::artifical::artificial
    ::artificailly::artificially
    ::asepct::aspect
    ::asepcts::aspects
    ::assmebly::assembly
    ::assembyl::assembly
    :*:asert::assert                ; assert/s/ed/ing/ion/True/Equal
    :*:assrt::assert
    :*:asssert::assert
    :*:asserrt::assert
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
    ::assigend::assigned
    ::asignment::assignment
    ::assingment::assignment
    ::asignments::assignments
    ::assingments::assignments
    ::asisgns::assigns
    ::assings::assigns
    :*:assocait::associat           ; associat/e/ed/es/ing/ive
    :*:assocate::associate
    ::assoicative::associative
    ::assuem::assume
    ::asycn::async
    :*:asycnhro::asynchro
    :*:asynchornous::asynchronous   ; asynchronous/ly
    :*:asychrnous::asynchronous
    :*:asyncrhonous::asynchronous
    :*:asynchrnous::asynchronous
    ::atmoic::atomic
    ::atmoics::atomics
    :*:attahc::attach               ; attach/ed/es/ment
    ::attakc::attack
    :*:attemtp::attempt             ; attempt/s/ed/ing
    :*:atribute::attribute          ; attribute/d/s
    :*:attirbute::attribute
    :*:attirubte::attribute
    :*:attriubte::attribute
    :*:attribtue::attribute
    ::auido::audio
    ::aduio::audio
    :*:authetnic::authentic         ; authentic/ate/ity/ator/ating
    :C:auot::auto                   ; C++ keyword
    :*:autocompelt::autocomplet     ; autocomplet/e/ed/es/ing/ion
    :*:auotmat::automat             ; automat/e/ed/ic/ion/ated
    :*:autoamt::automat
    :*:autoatm::automat
    ::automted::automated
    ::avialability::availability
    ::avialable::available
    ::aveareg::average
    ::aveage::average
    ::avearge::average
    ::avearegd::averaged
    ::aveaged::averaged
    ::avearged::averaged
    ::avearegs::averages
    ::aveages::averages
    ::avearges::averages
    ::aovid::avoid
    ::avodi::avoid
    ::aviod::avoid
    ::vaoid::avoid
    ::awiat::await
    ::awkae::awake
    ::awkawrd::awkward

    ::bakcend::backend
    ::backgorund::background
    ::backgournd::background
    ::backgorudn::background
    ::bakcground::background
    ::bakclog::backlog
    ::bakcspace::backspace
    :*:bakctrack::backtrack         ; backtrack/s/ed/ing
    :*:backtrakc::backtrack
    ::bakcup::backup
    ::bakcups::backups
    ::bakcward::backward
    ::bakcwards::backwards
    :*:blaance::balance             ; balance/d/r/s/rs
    ::balnaced::balanced
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
    :C:bahs::bash
    ::basign::basing
    ::baezl::bazel                  ; build tool
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
    ::bfeore::before
    ::begni::begin
    ::begining::beginning
    ::begnis::begins
    :*:behaivor::behavior           ; behavior/s/al
    :*:behvaior::behavior
    :*:behaviro::behavior
    :*:beahvior::behavior
    ::bheind::behind
    ::behidn::behind
    :*:bleong::belong               ; belong/s/ed/ing/ings
    :*:belogn::belong
    ::belongigns::belongings
    ::bleow::below
    ::belwo::below
    :*:benhcmark::benchmark         ; benchmark/s/ed/ing
    :*:bnehcmark::benchmark
    :*:benchmakr::benchmark
    :*:bnechmark::benchmark
    ::benchmarekd::benchmarked
    ::benefist::benefits
    ::betwen::between
    ::beyodn::beyond
    ::billino::billion
    ::billinos::billions
    ::bniary::binary
    ::ibnary::binary
    ::binayr::binary
    :*:blakc::black                 ; black/box/out/board
    :*:lbock::block                 ; block/s/ed/chain/ing
    ::blokcage::blockage
    ::blockchian::blockchain
    ::bookmarekd::bookmarked
    ::bolean::boolean
    ::boolena::boolean
    ::borderlien::borderline
    :*:bororw::borrow               ; borrow/s/ed/er/ing
    :C:boht::both
    :C:obth::both
    :*:bottlenekc::bottleneck       ; bottleneck/s/ed
    :*:boucne::bounce               ; bounce/d/r/s
    ::boudnaries::boundaries
    ::boudnary::boundary
    :*:brnach::branch               ; branch/ed/es/ing/less
    :*:brachn::branch
    :*:brnahc::branch
    ::branhc::branch                ; prefix rule not needed
    ::braech::breach
    :*:breka::break                 ; break/s/point/through
    :*:brkea::break
    :C:braek::break
    :C*:berak;::break;
    ::breakpiotn::breakpoint
    ::breakpiotns::breakpoints
    ::breakthrouhg::breakthrough
    :*:brdig::bridg                 ; bridg/e/ed/es/ing
    :*:braodcast::broadcast         ; broadcast/s/ed/ing/er
    ::borke::broke
    ::borken::broken
    ::broekn::broken
    ::brokne::broken
    ::borker::broker
    ::brokre::broker
    ::broekr::broker
    ::borkers::brokers
    ::brokres::brokers
    ::broekrs::brokers
    :*:borws::brows                 ; brows/ed/er/es/ers/ing
    :*:brwos::brows
    ::browsign::browsing
    ::bulid::build
    ::biuld::build
    ::ubild::build
    ::buidl::build
    ::biudl::build
    ::bulider::builder
    ::biulder::builder
    ::ubilder::builder
    ::buidler::builder
    ::biudler::builder
    ::buliding::building
    ::biulding::building
    ::ubilding::building
    ::buidling::building
    ::biudling::building
    ::bulids::builds
    ::biulds::builds
    ::ubilds::builds
    ::buidls::builds
    ::biudls::builds
    ::biult::built
    ::ubilt::built
    ::bucnh::bunch
    ::ubndle::bundle
    ::ubndles::bundles
    :C:BUt::But
    ::but nto::but not
    ::but ont::but not
    ::byt he::by the
    ::bypassign::bypassing
    ::bytearay::bytearray           ; Python built-in type

    ::cahce::cache
    ::acche::cache
    ::acched::cached
    :*:calcualt::calculat           ; calculat/e/ed/es/or/ion
    :*:caluclat::calculat
    ::calucation::calculation
    ::calucations::calculations
    ::calenadr::calendar
    ::claendar::calendar
    ::calenadrs::calendars
    ::claendars::calendars
    :C:clal::call
    ::clalable::callalble
    ::clalback::callback
    ::clalbacks::callbacks
    ::claled::called
    ::claler::caller
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
    ::catpuring::capturing
    ::cpaturing::capturing
    ::carog::cargo                  ; Rust package manager
    :C:caes::case                   ; switch-case
    :*:catgeor::categor             ; categor/y/ies/ical
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
    ::causign::causing
    :*:cuation::caution             ; caution/s/ed/ary
    ::ceasign::ceasing
    ::cetner::center
    ::cetners::centers
    ::centrla::central
    ::certian::certain
    ::certianly::certainly
    ::certiifcate::certificate
    ::certiifcates::certificates
    :*:cgropu::cgroup               ; cgroup/s. linux control groups
    :*:cgorup::cgroup
    ::cahining::chaining
    ::chaingn::chaining
    ::chianing::chaining
    ::chians::chains
    ::challegne::challenge
    ::challegning::challenging
    ::chagne::change
    ::cahnge::change
    ::chagen::change
    ::chnage::change
    ::chaneg::change
    ::chagned::changed
    ::cahnged::changed
    ::chagend::changed
    ::chnaged::changed
    ::chanegd::changed
    ::chagnes::changes
    ::cahnges::changes
    ::chagens::changes
    ::chnages::changes
    ::chanegs::changes
    ::chagning::changing
    ::cahnging::changing
    ::chnaging::changing
    ::channle::channel
    ::chanenl::channel
    ::channles::channels
    ::chanenls::channels
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
    ::chasr::chars
    ::chasign::chasing
    ::cheaepr::cheaper
    ::chepaest::cheapest
    :*:chekc::check                 ; check/s/ed/er/ing/out/list/point
    :*:cehck::check
    ::checkpiotn::checkpoint
    ::checkpiotns::checkpoints
    ::chidl::child
    ::chlid::child
    ::cihld::child
    ::chidlren::children
    ::chlidren::children
    ::cihldren::children
    ::chocie::choice
    ::chocies::choices
    ::chosoe::choose
    ::choosign::choosing
    ::choes::chose
    ::chorme::chrome
    ::chrmoe::chrome
    ::cihper::cipher
    ::cihpertext::ciphertext
    :*:cirlce::circle               ; circle/d/s
    ::circuti::circuit
    ::circutis::circuits
    ::ciruclar::circular
    ::claiemd::claimed
    ::calimed::claimed
    ::clagn::clang
    ::clairfied::clarified
    ::clairfy::clarify
    ::clairfying::clarifying
    :C:clss::class
    ::calss::class
    ::clasdef::classdef             ; MATLAB keyword
    ::clsses::classes
    ::calsses::classes
    ::clases::classes
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
    ::claen::clean
    ::claened::cleaned
    ::clenaing::cleaning
    ::claening::cleaning
    ::clenas::cleans
    ::cleasn::cleans
    ::claens::cleans
    ::clenaup::cleanup
    ::claer::clear
    :C:clera::clear
    ::clraed::cleared
    ::clerad::cleared
    ::claers::clears
    ::cleras::clears
    ::clikc::click
    ::lcick::click
    ::lcicking::clicking
    ::clickcs::clicks
    ::clikcs::clicks
    ::lcicks::clicks
    ::clinet::client
    ::lcient::client
    ::clinets::clients
    ::lcients::clients
    ::lcock::clock
    ::clockc::clock
    ::lcocks::clocks
    ::clockcs::clocks
    ::cloen::clone
    ::cloens::clones
    ::clsoe::close
    ::clsoes::closes
    ::closign::closing
    ::clsoing::closing
    ::clsoure::closure
    ::closuer::closure
    ::clsoures::closures
    ::closuers::closures
    ::clodu::cloud
    :*:clutser::cluster             ; cluster/s/ed/ing
    :*:clsuter::cluster
    :C:COde::Code                   ; Visual Studio Code
    :*:collaboart::collaborat       ; collaborat/e/ed/es/ion/ing
    ::colleageus::colleagues
    :*:colelct::collect             ; collect/s/ing/ion/ions
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
    ::comamnd::command
    ::comamdn::command
    ::comands::commands
    ::commnads::commands
    ::commadns::commands
    ::commmands::commands
    ::comamnds::commands
    ::comamdns::commands
    :*:ocmment::comment             ; comment/s/ed/ing
    ::commetner::commenter
    ::commetners::commenters
    ::comit::commit
    ::comitment::commitment
    ::comitments::commitments
    ::comits::commits
    :*:commite::committe            ; committe/d/e/r/rs/es
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
    ::compairson::comparison
    ::comaprison::comparison
    ::comparson::comparison
    ::comparisions::comparisons
    ::compariosns::comparisons
    ::compaisons::comparisons
    ::compairsons::comparisons
    ::comaprisons::comparisons
    ::comparsons::comparisons
    ::compatibel::compatible
    ::comaptible::compatible
    ::compenstae::compensate
    ::compenstaes::compensates
    ::competitve::competitive
    ::comiplation::compilation
    :*:comiple::compile             ; compile/r/d/s
    :*:compiel::compile
    ::comiler::compiler
    ::compileres::compilers
    ::comilers::compilers
    :*:compelt::complet             ; complet/e/ed/es/ing/ion
    ::completley::completely
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
    ::ocmponent::component
    ::comopnents::components
    ::componets::components
    ::compoents::components
    ::comonents::components
    ::componenets::components
    ::compoennts::components
    ::ocmponents::components
    ::compsoe::compose
    ::composign::composing
    ::composeite::composite
    ::compostie::composite
    ::comopsition::composition
    ::compressign::compressing
    :*:compormis::compromis         ; compromis/e/ed/es/ing
    :*:comptua::computa             ; computa/ble/tion/tional/bility
    :*:comptue::compute             ; compute/r/s/d/rs
    :*:ocmpute::compute
    :*:cmopute::compute
    ::compuer::computer
    ::computre::computer
    ::compuers::computers
    :*:concatneate::concatenate     ; concatenate/d/r/s
    :*:concetp::concept             ; concept/s/ual/ualize
    :*:concpet::concept
    :*:cocnept::concept
    :*:conceptula::conceptual       ; conceptual/ise/ize
    :*:conceputal::conceptual
    :*:ocncurren::concurren         ; concurren/t/cy/tly
    :*:concuren::concurren
    ::concurrnetly::concurrently
    :*:ocndition::condition         ; condition/s/ed/al/ing
    :*:condtion::condition
    :*:conidtion::condition
    ::condiitonals::conditionals
    ::conditoining::conditioning
    :*:condutc::conduct             ; conduct/s/ed/ing
    :*:ocnfig::config               ; config/ure/urable/uration
    :*:conifg::config
    :*:confgi::config
    :*:configru::configur           ; configur/e/ed/es/ing/able/ation
    :*:confiugr::configur
    :*:confilct::conflict           ; conflict/s/ed/ing
    ::confusign::confusing
    :*:conenct::connect             ; connect/s/ed/ion/ing/ions/or
    :*:conect::connect
    :*:ocnnect::connect
    ::connectsion::connections
    ::conseuctive::consecutive
    ::consectuive::consecutive
    :*:consdier::consider           ; consider/s/ed/ably/ation
    ::considerd::considered
    :*:consitsen::consisten         ; consisten/t/cy/tly
    :*:conssiten::consisten
    :*:cosnisten::consisten
    ::consitency::consistency
    ::consitent::consistent
    ::consistnet::consistent
    ::consistnetly::consistently
    ::consoel::console
    ::cosole::console
    ::consoe::console
    ::conosle::console
    :*:cosnt::const                 ; const/ant/expr/raint/ructor
    :*:conts::const
    :*:ocnst::const
    :*:csont::const
    ::constexrp::constexpr          ; C++ keyword
    ::contexpr::constexpr
    ::constepxr::constexpr
    ::constrian::constrain
    ::constrians::constrains
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
    ::consumesr::consumers
    ::consuems::consumes
    :*:contian::contain             ; contain/s/er/ers/ing
    :*:contina::contain
    :*:ocntain::contain
    :*:ctonain::contain
    :*:conatin::contain
    :*:contanier::container         ; container/s/ise/ized
    ::contaiing::containing
    ::cnotent::content
    ::contnet::content
    ::cnotents::contents
    ::contnets::contents
    ::contenets::contents
    ::conents::contents
    ::contnes::contents
    :*:contets::contest             ; contest/s/ed/ant/ing
    :*:ocntext::context             ; context/s/ual/ually
    :*:conetxt::context
    :*:contniu::continu             ; continu/e/ous/ally/ously
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
    :*:contirbut::contribut         ; contribut/e/ed/es/or/ion
    ::contribtue::contribute
    ::contriubte::contribute
    ::contriubtes::contributes
    :*:contorl::control             ; control/s/led/ler/ling
    :*:ocntrol::control
    :*:converet::convert            ; convert/s/ed/er/ing/ible
    :*:covnert::convert
    ::convertes::converts
    ::cookei::cookie
    ::cookeis::cookies
    ::coopearte::cooperate
    ::coopearted::cooperated
    ::coopeartes::cooperates
    ::coopearting::cooperating
    ::coordiante::coordinate
    ::coordiantes::coordinates
    ::copeid::copied
    ::copeis::copies
    ::cpoy::copy
    ::coyp::copy
    ::cpoyable::copyable
    ::coypable::copyable
    ::copyrgiht::copyright
    ::coypright::copyright
    ::corenr::corner
    ::corenrs::corners
    ::coroutien::coroutine
    ::corotuine::coroutine
    ::coroutiens::coroutines
    ::corotuines::coroutines
    :*:corect::correct              ; correct/ed/ly/ion/ness
    :*:corretc::correct
    :*:corerct::correct
    :*:corresopnd::correspond       ; correspond/s/ed/ing
    :*:correspodn::correspond
    :*:corespond::correspond
    ::corresopnsd::corresponds
    ::coudl::could
    ::oculd::could
    ::could nto::could not
    ::could ont::could not
    ::coudln't::couldn't
    ::couldnt'::couldn't
    ::coulnd't::couldn't
    :*:coutn::count                 ; count/s/ed/er/ing
    :*:ocunt::count
    ::cuople::couple
    ::covearge::coverage
    ::coveage::coverage
    ::crakc::crack
    :*:crahs::crash                 ; crash/ed/es/ing
    :*:carsh::crash
    :*:crsah::crash
    ::crasehs::crashes
    ::crashse::crashes
    :*:cralw::crawl                 ; web crawl/s/ed/er/ing
    :*:carwl::crawl
    ::creaete::create
    ::creaet::create
    ::craete::create
    ::creatd::created
    ::creaeted::created
    ::craeted::created
    ::creats::creates
    ::creaetes::creates
    ::craetes::creates
    ::creaets::creates
    ::craeting::creating
    ::craetion::creation
    ::criteira::criteria
    ::crtieria::criteria
    ::critiera::criteria
    ::ciritcal::critical
    ::criitcal::critical
    ::criticial::critical
    ::crossign::crossing
    ::crossigns::crossings
    :*:crucnh::crunch               ; crunch/ed/er/es/ing
    :*:crytpo::crypto               ; crypto/graphy/graphic/currency
    :C:CTrl::Ctrl                   ; 'Control' keyboard modifier
    ::curent::current
    ::currrent::current
    ::currnet::current
    ::currrently::currently
    ::curently::currently
    ::currnetly::currently
    ::cusror::cursor
    ::curosr::cursor
    ::cusrors::cursors
    ::curosrs::cursors
    :*:cusotm::custom               ; custom/er/ers/ary/ise
    ::custoemr::customer
    ::custoemrs::customers
    ::customesr::customers
    ::customie::customize
    ::customied::customized
    ::customies::customizes
    ::cycel::cycle
    ::cyceld::cycled
    ::cycels::cycles

    ::deamon::daemon                ; background process
    ::damaeg::damage
    ::dahsboard::dashboard
    ::dahsboards::dashboards
    :*:dadta::data                  ; data/set/sets/base
    ::dtaa::data
    :*:datda::data
    ::databse::database
    ::databaes::database
    ::datbase::database
    ::dadtbase::database
    ::databsae::database
    ::dtaabase::database
    ::databses::databases
    ::datbases::databases
    ::dadtbases::databases
    ::databsaes::databases
    ::dtaabases::databases
    ::dataest::dataset
    ::dataests::datasets
    ::daedlock::deadlock
    ::daedlocks::deadlocks
    ::deallcoate::deallocate
    ::deallcoated::deallocated
    ::deallcoates::deallocates
    ::debuger::debugger
    ::debuging::debugging
    ::deciaml::decimal
    ::deicsion::decision
    ::deicsional::decisional
    ::deicsions::decisions
    :*:delcar::declar               ; declar/e/ed/es/ing/ation
    ::declaer::declare
    ::declraed::declared
    ::declaerd::declared
    ::declaers::declares
    ::decltyep::decltype            ; C++ keyword
    :*:decomipl::decompil           ; decompil/e/ed/es/ation
    ::decompressign::decompressing
    :*:decoart::decorat             ; decorat/e/ed/es/ing/ion
    ::decrase::decrease
    ::decrased::decreased
    ::decrases::decreases
    ::decreasign::decreasing
    :*:decrment::decrement          ; decrement/s/ed
    :*:dedutc::deduct               ; deduct/s/ed/ing
    ::deepcpoy::deepcopy
    :*:deafult::default             ; default/s/ed
    :*:defualt::default
    :*:defalut::default
    :*:dfeault::default
    :*:defautl::default
    ::defien::define
    ::defiend::defined
    ::defiens::defines
    ::defintion::definition
    ::defintions::definitions
    :*:dleete::delete               ; delete/s/d/r
    :*:deelte::delete
    ::deleet::delete
    ::deletd::deleted
    ::dleeting::deleting
    ::dleetion::deletion
    ::dleetions::deletions
    :*:deliimt::delimit             ; delimit/s/ed/er/ing
    :*:dleiver::deliver             ; deliver/s/ed/ery
    :*:dliever::deliver
    ::detla::delta
    ::demoign::demoing
    ::demonig::demoing
    :*:dmeonstrat::demonstrat       ; demonstrat/e/s/ing/ion/ive
    :*:demonstart::demonstrat
    :*:dentoe::denote               ; denote/d/s
    :*:dpeend::depend               ; depend/s/ence/ency/encies
    :*:depenenc::dependenc
    ::dependnet::dependent
    ::dependnets::dependents
    ::depht::depth
    ::detph::depth
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
    ::descritpor::descriptor
    ::descritpors::descriptors
    ::desing::design
    ::deisgn::design
    ::diesgn::design
    ::desinged::designed
    ::deisgned::designed
    ::deisnged::designed
    ::diesgned::designed
    ::desigend::designed
    ::desinger::designer
    ::deisgner::designer
    ::deisnger::designer
    ::diesgner::designer
    ::desigenr::designer
    ::desingers::designers
    ::deisgners::designers
    ::deisngers::designers
    ::diesgners::designers
    ::desigenrs::designers
    ::desinging::designing
    ::deisgning::designing
    ::deisnging::designing
    ::diesgning::designing
    ::desings::designs
    ::deisgns::designs
    ::deisngs::designs
    ::diesgns::designs
    ::dekstop::desktop
    ::dekstops::desktops
    ::destiation::destination
    ::destiations::destinations
    :*:destory::destroy             ; destroy/s/ed/ing
    :*:desturct::destruct           ; destruct/s/ed/or/ing/ive
    :*:detial::detail               ; detail/s/ed/er/ing
    :*:detemrin::determin           ; determin/e/ed/ant/ation/istic
    ::deteminant::determinant
    ::determien::determine
    ::determiend::determined
    ::determiens::determines
    ::determinsitic::deterministic
    ::determinstic::deterministic
    :*:devleop::develop             ; develop/s/ed/er/ing/ment
    :*:devloep::develop
    :*:dvelop::develop
    :*:dveelop::develop
    :*:devlop::develop
    ::developd::developed
    ::developr::developer
    ::developrs::developers
    ::developeres::developers
    ::developesr::developers
    ::develoment::development
    ::developement::development
    ::devcie::device
    ::deivce::device
    ::devcies::devices
    ::deivces::devices
    ::diagnosign::diagnosing
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
    ::did ont::did not
    ::din'dt::didn't
    ::dind't::didn't
    ::didnt'::didn't
    ::diference::difference
    ::dfiference::difference
    ::differnce::difference
    ::diferences::differences
    ::dfiferences::differences
    ::differnces::differences
    ::diferent::different
    :*:differnet::different         ; different/ial/iate/iable
    :*:dfiferent::different
    :*:differnt::different
    :*:dififcult::difficult         ; difficult/y/ies
    :*:difficutl::difficult
    :*:diffiuclt::difficult
    ::difficulyt::difficulty
    ::difficluty::difficulty
    ::digets::digest
    :*:diigt::digit                 ; digit/s/al/ally
    :*:dgiit::digit
    :*:idgit::digit
    ::digiatlly::digitally
    ::digist::digits
    :*:diemnsion::dimension         ; dimension/s/al/ality
    ::dimensinoal::dimensional
    ::dimensinoality::dimensionality
    ::diminsih::diminish
    ::diminsihes::diminishes
    ::diminsihing::diminishing
    :*:driect::direct               ; direct/s/ed/ly/ive/ion/ory
    :*:dierct::direct
    ::directd::directed
    ::diretories::directories
    ::directoires::directories
    ::direcotires::directories
    ::diretory::directory
    ::directoroy::directory
    ::diable::disable
    ::disbale::disable
    ::diabled::disabled
    ::disbaled::disabled
    ::disabeld::disabled
    ::disalbed::disabled
    ::diables::disables
    ::disbales::disables
    ::disadvnatage::disadvantage
    ::disadvnatages::disadvantages
    :*:disconenct::disconnect       ; disconnect/ed/ion/ing/ions/or
    :*:disconect::disconnect
    :*:disocver::discover           ; discover/s/y/ed/ing
    ::discussign::discussing
    ::idsk::disk
    ::idsks::disks
    ::dispaly::display
    ::idsplay::display
    ::idsplayed::displayed
    ::dispalying::displaying
    ::idsplaying::displaying
    ::dispalys::displays
    ::idsplays::displays
    ::disposign::disposing
    ::idstance::distance
    ::idstances::distances
    :*:distni::distin               ; distin/ct/ction/guish/guished
    :*:distirbut::distribut         ; distribut/e/ed/er/ion/ing
    :*:dsitribut::distribut
    ::distribtue::distribute
    ::distriuted::distributed
    ::distribued::distributed
    ::distriubtion::distribution
    ::distriubtions::distributions
    ::od not::do not
    ::do nto::do not
    ::do ont::do not
    ::dokc::dock
    :*:dokcer::docker               ; docker/ize/file/ized
    ::dockerfiel::dockerfile
    :*:docment::document            ; document/s/ed/ing/ation
    :*:odcument::document
    :*:doucment::document
    :*:documnt::document
    :*:docuemnt::document
    ::documentd::documented
    :C:DOes::Does
    ::doesn ot::does not
    ::doe snot::does not
    ::doesnot::does not
    ::does nto::does not
    ::does ont::does not
    ::doesnt'::doesn't
    ::doens't::doesn't
    ::doenst::doesn't
    ::doen'st::doesn't
    ::dosen't::doesn't
    ::odesn't::doesn't
    ::odens't::doesn't
    ::does'nt::doesn't
    ::doe'snt::doesn't
    ::doign::doing
    ::donig::doing
    ::domian::domain
    ::domians::domains
    ::dont'::don't
    ::dno't::don't
    ::do'nt::don't
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
    :*:dowlnoad::download
    ::downsream::downstream
    ::donwstream::downstream
    ::darw::draw
    ::darwing::drawing
    :*:drvie::drive                 ; drive/n/r/s/rs
    :*:dirve::drive
    ::drvoe::drove
    ::due ot::due to
    ::dupm::dump
    ::dupmed::dumped
    ::dupming::dumping
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
    :*:dyanm::dynam                 ; dynam/ic/ics/oDB

    ::eahc::each
    :C:aech::each
    ::eralier::earlier
    ::eraly::early
    ::easeir::easier
    ::eaisly::easily
    ::easign::easing
    ::ehco::echo
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
    ::efficinetly::efficiently
    :*:eigne::eigen                 ; eigen/space/value/vector
    ::iether::either
    ::eihter::either
    ::elapsign::elapsing
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
    ::ellitpic::elliptic            ; elliptic curve
    :C:esle::else
    ::elsei f::else if
    ::esel if::else if
    ::esleif::elseif
    ::eselif::elseif
    ::emaling::emailing
    ::embeded::embedded
    ::emited::emitted
    ::emiting::emitting
    :*:emphaisze::emphasize         ; emphasize/d/s
    :*:emphasiez::emphasize
    :*:emphaszie::emphasize
    ::empalce::emplace
    ::employesr::employers
    ::emtpied::emptied
    ::emtpies::empties
    ::emtpy::empty
    ::empyt::empty
    :C:emty::empty
    ::emualte::emulate
    ::emualted::emulated
    ::emualtes::emulates
    ::emualtion::emulation
    ::enbale::enable
    ::eanble::enable
    ::enbaled::enabled
    ::enalbed::enabled
    ::enabeld::enabled
    ::eanbled::enabled
    ::enbales::enables
    ::eanbles::enables
    ::encapuslation::encapsulation
    ::encalve::enclave
    ::encodres::encoders
    :*:encoutner::encounter         ; encounter/s/ed/ing
    :C:ENd::End                     ; Visual Basic keyword
    :C:enld::endl                   ; C++ newline (endline)
    :C:ednl::endl
    ::endores::endorse
    ::endorsign::endorsing
    ::engaeg::engage
    ::egnine::engine
    ::engien::engine
    ::enginer::engineer
    ::egnineer::engineer
    ::enginered::engineered
    ::egnineered::engineered
    ::enginers::engineers
    ::egnineers::engineers
    ::egnines::engines
    ::engiens::engines
    :*:enahnce::enhance             ; enhance/d/s/ment/ments
    :*:enhacne::enhance
    :*:enhnace::enhance
    ::enhancment::enhancement
    ::enhancments::enhancements
    ::enoguh::enough
    ::enuogh::enough
    ::enouhg::enough
    ::ensuer::ensure
    ::enusred::ensured
    ::ensuers::ensures
    ::ensruing::ensuring
    :*:ential::entail               ; entail/s/ed/ing/ment
    ::etnire::entire
    ::entrie::entire
    ::entites::entities
    ::enttiy::entity
    ::entiyt::entity
    ::enitty::entity
    ::etnity::entity
    ::entroyp::entropy
    ::enumeate::enumerate
    ::enuemrate::enumerate
    ::enumearte::enumerate
    ::enumeated::enumerated
    ::enuemrated::enumerated
    ::enumearted::enumerated
    ::enumeates::enumerates
    ::enuemrates::enumerates
    ::enumeartes::enumerates
    ::enumearting::enumerating
    ::enumeating::enumerating
    ::enuemrating::enumerating
    :*:envrion::environ             ; environ/ment/ments/mental
    :*:enviorn::environ
    :*:envirno::environ
    :*:enviroment::environment      ; environment/s/al
    :*:euqal::equal                 ; equal/s/ed/ly/ing/ity
    :*:equla::equal
    :*:euqla::equal
    ::eqeuation::equation
    ::equateion::equation
    ::equateions::equations
    :*:eqiuvalen::equivalen         ; equivalen/t/ce/cy/tly
    ::equivalenet::equivalent
    ::equivlent::equivalent
    ::equivlaent::equivalent
    ::eraes::erase
    ::eraesr::eraser
    ::eraesrs::erasers
    ::eraess::erases
    ::erasign::erasing
    ::erasuer::erasure
    ::errror::error
    ::errrors::errors
    ::espanos::espanso              ; text expander (see README.md)
    ::especailly::especially
    ::essentailly::essentially
    :*:establihs::establish         ; establish/ed/es/ing
    :*:estalbish::establish
    :*:esitmat::estimat             ; estimat/e/ed/es/ing/ion
    ::estimiation::estimation
    :*:evlauat::evaluat             ; evaluat/e/ed/es/ing/ion
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
    ::eveyrone::everyone
    ::everyoen::everyone
    ::everyting::everything
    ::everytyhing::everything
    ::everthing::everything
    ::evertyhing::everything
    ::everytying::everything
    ::everyhting::everything
    :*:exatc::exact                 ; exact/s/ed/ly/ing
    ::examien::examine
    ::examiend::examined
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
    :*:excepet::except
    ::excahnge::exchange
    ::exchagne::exchange
    ::excahnged::exchanged
    ::exchagned::exchanged
    ::excahnges::exchanges
    ::exchagnes::exchanges
    ::excldue::exclude
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
    ::exectues::executes
    ::exeution::execution
    ::execuion::execution
    ::exemtp::exempt
    :*:exhuast::exhaust             ; exhaust/s/ed/ing/ive
    :*:eixst::exist                 ; exist/s/ed/ing/ence
    :C:exti::exit
    ::eixt::exit
    :*:exit9)::exit()
    ::extied::exited
    ::eixted::exited
    ::eixting::exiting
    ::extis::exits
    ::eixts::exits
    ::exapnd::expand
    ::exapnded::expanded
    ::exapnds::expands
    ::expanison::expansion
    ::expnasion::expansion
    :*:exepct::expect               ; expect/s/ed/ing
    ::expetcation::expectation
    ::expectd::expected
    :*:exepri::experi               ; experi/ence/ment/enced/ences/ments/mentation
    :*:expeir::experi
    ::expereinced::experienced
    ::exipry::expiry
    :*:expalin::explain             ; explain/s/ed/ing
    :*:explian::explain
    :*:explina::explain
    :*:expailn::explain
    ::explaning::explaining
    ::explcit::explicit
    ::explclit::explicit
    ::explcitly::explicitly
    ::explclitly::explicitly
    ::explroer::explorer
    :*:exopential::exponential      ; exponential/s/ly
    :*:expoentnial::exponential
    :*:expoential::exponential
    :*:expoenntial::exponential
    :*:expoenential::exponential
    :*:exponenetial::exponential
    ::exponentailly::exponentially
    ::exponentaite::exponentiate
    ::exponentaites::exponentiates
    :*:exoprt::export               ; export/ed/er/s
    ::exposign::exposing
    ::exposuer::exposure
    ::expressign::expressing
    ::expresison::expression
    ::expresion::expression
    ::exprssion::expression
    ::expresisons::expressions
    ::expresions::expressions
    ::exprssions::expressions
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
    ::extraenous::extraneous
    :*:extrapoalt::extrapolat       ; extrapolat/e/ed/es/ing

    :*:facotr::factor               ; factor/s/y/ed/ial/ies
    ::factorila::factorial
    :C:fial::fail
    ::faield::failed
    ::fialed::failed
    ::falied::failed
    ::fialing::failing
    ::fials::fails
    ::failrue::failure
    ::fialure::failure
    ::fialrue::failure
    ::fairue::failure
    ::afilure::failure
    ::failuer::failure
    ::failrues::failures
    ::fialures::failures
    ::fialrues::failures
    ::fairues::failures
    ::afilures::failures
    ::failuesr::failures
    ::failuers::failures
    ::fiarly::fairly
    ::fkae::fake
    ::fkaed::faked
    ::fallthrouhg::fallthrough
    ::flase::false
    ::aflse::false
    :C:fales::false
    ::fasle::false
    :C:FAlse::False
    :*:fasel;::false;
    ::familar::familiar
    ::familair::familiar
    ::fmailiar::familiar
    ::faimly::family
    ::fmaily::family
    ::fatser::faster
    ::fautl::fault
    ::favoriet::favorite
    ::favoirte::favorite
    ::favortie::favorite
    ::faovirte::favorite
    ::favoriets::favorites
    ::favoirtes::favorites
    ::favorties::favorites
    ::faovirtes::favorites
    :*:faeture::feature             ; feature/d/s
    :*:fetaure::feature
    ::fethc::fetch
    ::fecth::fetch
    ::fecthed::fetched
    ::fecthes::fetches
    ::fecthing::fetching
    ::fideilty::fidelity
    ::fidleity::fidelity
    ::fiedl::field
    ::fiedls::fields
    ::ifle::file
    ::fielname::filename
    ::fiels::files
    ::ifles::files
    ::filse::files
    :*:fielsystem::filesystem       ; filesystem/s
    :*:iflesystem::filesystem
    :*:filesytem::filesystem
    :*:filesytsem::filesystem
    :*:filesysetm::filesystem
    :*:filessytem::filesystem
    ::filemd::filmed
    ::ifnal::final
    ::fianl::final
    ::fainl::final
    ::finaly::finally
    ::finnaced::financed
    ::finaincial::financial
    ::fidn::find
    :C:FInd::Find
    :C:ifnd::find
    :C:fnid::find
    ::ifnder::finder                ; macOS finder
    ::fnider::finder
    ::ifnding::finding
    ::fniding::finding
    ::fidns::finds
    ::ifnds::finds
    ::fnids::finds
    :*:finsih::finish               ; finish/ed/es/ing
    ::fireofx::firefox
    ::fisrt::first
    ::firsrt::first
    ::ifrst::first
    :C:firts::first
    :C:falg::flag
    ::falgs::flags
    ::flgas::flags
    ::flahs::flash
    ::flaot::float
    ::flaoting::floating
    ::flaots::floats
    ::flwo::flow
    ::flwos::flows
    :*:ofcus::focus                 ; focus/ed/es/ing
    ::focuesd::focused
    ::focusign::focusing
    ::fodler::folder
    ::fodlers::folders
    ::foldres::folders
    ::fodling::folding
    :*:folow::follow                ; follow/s/ed/er/ing
    :*:follwo::follow
    :C:ofr::for                     ; 'for' keyword
    :C:FOr::For
    :*:fo r(::for (                 ; 'for' loop
    ::fo rthat::for that
    ::fo rthe::for the
    ::fort he::for the
    ::fo rteh::for the
    ::fo rhte::for the
    ::fro the::for the
    ::fo rthis::for this
    ::foreeach::foreach             ; Perl keyword
    ::foraech::foreach
    ::foregorund::foreground
    ::foregournd::foreground
    ::foregorudn::foreground
    ::foriegn::foreign
    ::froeign::foreign
    ::foreing::foreign
    :*:ofrmat::format               ; format/s/ed/ter/ting
    :*:foramt::format
    ::formated::formatted
    ::formater::formatter
    ::formating::formatting
    ::froms::forms
    ::fomrula::formula
    ::fomrulas::formulas
    :*:formualte::formulate         ; formulate/d/s
    :C:forSOme::forSome             ; Scala keyword
    ::forwrading::forwarding
    :*:foudn::found                 ; found/ation/ational
    :*:framgent::fragment           ; fragment/s/ed/ing/ation
    ::frmae::frame
    ::famre::frame
    ::frmaed::framed
    ::famred::framed
    ::frmaes::frames
    ::famres::frames
    ::frmaework::framework
    ::freeign::freeing
    ::freenig::freeing
    :*:freuqen::frequen             ; frequen/t/cy/tly
    :*:frquen::frequen
    :*:frueqen::frequen
    ::freuent::frequent
    ::freuently::frequently
    ::firend::friend
    ::freind::friend
    ::friedn::friend
    ::firends::friends
    ::freinds::friends
    :C:FRom::From
    ::frmo::from
    ::fro mthe::from the
    ::fornt::front
    ::frotn::front
    ::forntier::frontier
    ::frotnier::frontier
    ::forzen::frozen
    ::forzenset::frozenset          ; Python container
    :C:fucn::func                   ; Go function keyword
    :*:fucntion::function           ; function/s/al/ing/ality/alities
    :*:funtion::function
    :*:fnction::function
    :*:fucniton::function
    :*:fucntino::function
    :*:fucntoin::function
    :*:fucniotn::function
    :*:funtcion::function
    :*:fuction::function
    :*:fuctnion::function
    :*:funciton::function
    ::functioal::functional
    ::functoining::functioning
    ::funadmental::fundamental
    ::fudnamental::fundamental
    ::funadmentals::fundamentals
    ::fudnamentals::fundamentals
    ::fudns::funds
    ::fusign::fusing

    ::gatewya::gateway
    ::gatewyas::gateways
    ::gatehrs::gathers
    ::guage::gauge
    ::guaged::gauged
    ::guages::gauges
    :*:gneer::gener                 ; gener/al/ic/ate/ates/ator
    :*:geneart::generat             ; generat/e/es/or/ing/ion
    ::geneate::generate
    ::genreate::generate
    ::geneates::generates
    ::genreates::generates
    ::geneating::generating
    ::generaetion::generation
    ::generaetor::generator
    ::generaetors::generators
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
    ::goign::going
    ::gonig::going
    ::going ot::going to
    ::gradiet::gradient
    ::gradaul::gradual
    ::gratner::granter
    ::gratners::granters
    ::granuliarty::granularity
    :*:grpah::graph                 ; graph/s/ic/ics/ing
    :*:grahp::graph
    :*:garph::graph
    ::gerat::great
    ::gretaer::greater
    :C:grpe::grep
    ::gridn::grind
    ::gridns::grinds
    ::gorund::ground
    ::gournd::ground
    ::gorudn::ground
    ::gorunds::grounds
    ::gournds::grounds
    ::gorudns::grounds
    :*:gropu::group                 ; group/s/ed/ing
    :C:gorup::group
    ::goruped::grouped
    ::grouepd::grouped
    ::goruping::grouping
    ::gorups::groups
    ::gronw::grown
    ::guessign::guessing

    ::hakc::hack
    :C:ahd it::had it
    ::had nto::had not
    ::had ont::had not
    ::ahd not::had not
    ::ahd to::had to
    ::hadnt'::hadn't
    ::hlaf::half
    ::hadnle::handle
    ::hanlde::handle
    ::hadnled::handled
    ::hanlded::handled
    ::hadnler::handler
    ::handelr::handler
    ::hanlder::handler
    ::hadnlers::handlers
    ::handelrs::handlers
    ::hanlders::handlers
    ::hadnles::handles
    ::hanldes::handles
    ::hadnling::handling
    ::hanlding::handling
    ::hapen::happen
    ::hapened::happened
    ::hapepned::happened
    ::hapepend::happened
    ::happend::happened
    ::hapening::happening
    ::hapepning::happening
    ::hapens::happens
    ::ahrd::hard
    :C:hadr::hard
    ::ahrden::harden
    ::hadren::harden
    ::ahrder::harder
    ::hadrer::harder
    ::hadrware::hardware
    ::ahrdware::hardware
    ::harenss::harness
    :C:hsa::has
    :C:Hsa::Has
    :C:HAs::Has
    ::has nto::has not
    ::has ont::has not
    ::has ot::has to
    ::hahs::hash
    ::hahsable::hashable
    ::hahsmap::hashmap
    ::hashmpa::hashmap
    ::hahstable::hashtable
    ::hasnt'::hasn't
    ::has'nt::hasn't
    ::hans't::hasn't
    ::hastn'::hasn't
    ::hvae::have
    ::ahve::have
    ::haev::have
    :C:HAve::Have
    ::have nto::have not
    ::have ont::have not
    :C:have ot::have to
    ::have'nt::haven't
    ::havn'et::haven't
    ::havne't::haven't
    ::ahven't::haven't
    ::hvaen't::haven't
    ::haevn't::haven't
    ::haven'et::haven't
    ::havent'::haven't
    ::ahving::having
    ::helath::health
    ::heatlh::health
    ::healht::health
    ::helathier::healthier
    ::heatlhier::healthier
    ::healhtier::healthier
    ::healtheir::healthier
    ::helathiest::healthiest
    ::heatlhiest::healthiest
    ::healhtiest::healthiest
    ::helathy::healthy
    ::heatlhy::healthy
    ::healhty::healthy
    ::hieght::height
    ::hieghts::heights
    ::hlep::help
    ::hleper::helper
    ::hleping::helping
    ::hleps::helps
    :C:HEre::Here
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
    ::hodling::holding
    ::hodls::holds
    :C:hoem::home
    ::horizonatlly::horizontally
    :C:hsot::host
    ::hostnaem::hostname
    ::hostnmae::hostname
    ::hostnaems::hostnames
    ::hostnmaes::hostnames
    ::hsots::hosts
    :C:horus::hours
    :C:HOw::How
    ::hwo are::how are
    ::hwo can::how can
    ::hwo do::how do
    ::how od::how do
    ::hwo does::how does
    ::hwo is::how is
    ::hwo it::how it
    :C:how ti::how it
    ::howthe::how the
    ::hwo the::how the
    :C:how ot::how to
    ::hwo to::how to
    ::howt o::how to
    ::hwo ot::how to
    ::howver::however
    ::hoewver::however
    ::humna::human
    ::humnas::humans
    ::hudnred::hundred
    ::hudnreds::hundreds
    :*:hyperparameer::hyperparameter  ; hyperparameter/s/ize
    :*:hyperpareamter::hyperparameter
    :*:hyperparaemter::hyperparameter
    :*:hyperparmaeter::hyperparameter
    ::hyperivsor::hypervisor
    ::hyperivsors::hypervisors

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
    ::idetnical::identical
    :*:idnetif::identif             ; identif/y/ies/iable/ication
    ::idenetifier::identifier
    ::idenetify::identify
    ::identtiy::identity
    ::identiyt::identity
    ::idenitty::identity
    ::idenetity::identity
    ::idnetity::identity
    ::idetnity::identity
    ::fi it::if it
    :C:IF it::If it
    ::fi that::if that
    :C:IF that::If that
    ::fi the::if the
    :C:IF the::If the
    ::fi these::if these
    :C:IF these::If these
    ::fi they::if they
    :C:IF they::If they
    ::fi this::if this
    :C:IF this::If this
    ::fi those::if those
    :C:IF those::If those
    ::fi you::if you
    :C:IF you::If you
    :*:igonr::ignor                 ; ignor/e/ed/es/ing
    ::illegla::illegal
    ::iamge::image
    ::imaeg::image
    ::iamges::images
    ::imblaance::imbalance
    ::imblaanced::imbalanced
    ::immeidate::immediate
    ::immedaite::immediate
    ::immeidately::immediately
    ::immediatley::immediately
    ::imutable::immutable
    :*:imapct::impact               ; impact/s/ed/ful
    ::impereative::imperative
    :*:implmenet::implement         ; implement/s/ing/ation/ations
    :*:implmeent::implement
    :*:impelement::implement
    :*:impelment::implement
    ::implemenation::implementation
    ::implemeentation::implementation
    ::implementeation::implementation
    ::implemenations::implementations
    ::implemeentations::implementations
    ::implementeations::implementations
    ::implciit::implicit
    ::implcit::implicit
    ::implclit::implicit
    ::implciitly::implicitly
    ::implcitly::implicitly
    ::implclitly::implicitly
    :*:imoprt::import               ; import/s/ed/er/ant
    :*:imorpt::import
    ::imporant::important
    ::imposible::impossible
    ::imposisble::impossible
    :*:imprvoe::improve             ; improve/d/s/ment
    :*:imrpove::improve
    ::improvment::improvement
    ::improvments::improvements
    :C:i na::in a
    ::i nan::in an
    ::inthe::in the
    ::i nthe::in the
    :C:ni the::in the
    ::incidnet::incident
    ::incidnets::incidents
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
    ::incomaptible::incompatible
    ::incrase::increase
    ::increaes::increase
    ::icnrease::increase
    ::incrased::increased
    ::icnreased::increased
    ::incrases::increases
    ::icnreases::increases
    ::increasign::increasing
    :*:icnrement::increment         ; increment/s/al/ed/ing
    :*:incrment::increment
    ::incremenatlly::incrementally
    :*:indnet::indent               ; indent/s/ed/ing/ation
    ::indpeendent::independent
    ::independnet::independent
    ::indpeendently::independently
    ::independnetly::independently
    :*:idnex::index                 ; index/ed/es/ing
    :*:indeex::index
    :*:nidex::index
    :*:inidcat::indicat             ; indicat/e/es/or/ion
    :*:idnicat::indicat
    ::individaul::individual
    :*:indutc::induct               ; induct/s/ed/ing/ion
    ::ineficient::inefficient
    ::inifnity::infinity
    :C:inof::info
    :C:ifno::info
    :*:infomr::inform               ; inform/s/ed/ation/ative
    :*:inofrmati::informati         ; informati/on/ve/cs/onal
    :*:ifnormati::informati
    ::infrasturcture::infrastructure
    :*:infreuqent::infrequent       ; infrequent/ly
    :*:infrquent::infrequent
    :*:inherti::inherit             ; inherit/s/ed/ance
    :*:inhreit::inherit
    :*:inehrit::inherit
    :*:inehrti::inherit
    :*:intiial::initial             ; initial/ly/ize/ized/ization
    :*:initail::initial
    :*:initlia::initial
    :*:iniital::initial
    :*:iniitat::initiat             ; initiat/e/ed/or/ing
    :*:initait::initiat
    :*:intiiat::initiat
    :*:initiait::initiat
    :*:inejct::inject               ; inject/s/ed/ing/ion
    ::inlien::inline
    ::inliens::inlines
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
    :*:insepct::inspect             ; inspect/s/ed/ing/ion
    :*:isnta::insta                 ; insta/ll/nt/nce/ntiate/llation
    :*:intall::install              ; install/ed/er/ation
    :*:instsall::install
    :*:intsall::install
    :*:instlal::install
    ::intance::instance
    ::intances::instances
    ::instantaenous::instantaneous
    ::instantaenously::instantaneously
    :*:instantaite::instantiate     ; instaniate/d/s
    :*:instnatiate::instantiate
    ::isntead::instead
    ::intsead::instead
    ::intead::instead
    ::instad::instead
    ::insetad::instead
    ::isnetad::instead
    ::instaed::instead
    ::insteado f::instead of
    ::isnteadof::insteadof          ; PHP
    :*:isntru::instru               ; instru/ment/ments/ction/ctions
    ::insruction::instruction
    ::insructions::instructions
    :C:itn::int                     ; integer data type
    :*:itneg::integ                 ; integ/er/ral/rity/ration
    ::intger::integer
    ::integeres::integers
    ::intgers::integers
    :*:integerat::integrat          ; integrat/ed/es/ion
    ::integirty::integrity
    :*:intelig::intellig            ; intellig/ent/ence/ible
    ::intnet::intent
    :*:itner::inter                 ; inter/act/nal/val/face
    ::intercetp::intercept
    ::intercetps::intercepts
    ::intersting::interesting
    ::interafce::interface
    ::inteface::interface
    ::interfcae::interface
    ::interafces::interfaces
    ::intefaces::interfaces
    ::interfcaes::interfaces
    ::internla::internal
    ::intenral::internal
    ::interanl::internal
    ::intenrla::internal
    ::internlas::internals
    ::intenrals::internals
    ::interanls::internals
    ::intenrlas::internals
    ::internte::internet
    ::interopeate::interoperate
    :*:intepr::interp               ; interp/ret/rets/olate/olation/retation
    :*:interoplat::interpolat       ; interpola/e/ed/es/ing
    :*:interperet::interpret        ; interpret/s/ed/er/ing/ation
    :*:interpert::interpret
    :*:intrepret::interpret
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
    :*:itnro::intro                 ; intro/duce/spect/duction
    :*:intorduc::introduc           ; introduc/e/d/s/tion
    :*:introuce::introduce          ; introduce/d/s
    :*:introudce::introduce
    :*:introdcue::introduce
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
    :*:invnet::invent               ; invent/s/ed/ing/ory
    ::invesre::inverse
    :*:ivnest::invest               ; invest/s/ed/ing/ment/igate
    :*:invets::invest
    ::invoekr::invoker
    :*:invovl::involv               ; involv/e/ed/es/ing/ement
    :*:inovlv::involv
    ::iosream::iostream             ; C++ I/O header
    ::iosteam::iostream
    ::isotream::iostream
    ::iostraem::iostream
    :C:si it::is it
    :C:IS it::Is it
    ::is nto::is not
    ::is ont::is not
    :C:si that::is that
    ::isthe::is the
    ::i sthe::is the
    :C:si the::is the
    :C:si this::is this
    :C:is ot::is to
    :C:si to::is to
    ::isintance::isinstance         ; Python function
    ::ins't::isn't
    ::isnt'::isn't
    ::sin't::isn't
    ::is'nt::isn't
    ::in'st::isn't
    ::isseu::issue
    ::isseud::issued
    ::isseus::issues
    ::issuse::issues
    ::issuign::issuing
    :C:ti is::it is
    ::iti s::it is
    ::it ot::it to
    ::i twas::it was
    :C:ti was::it was
    ::i'ts::it's
    ::iteate::iterate
    ::iteates::iterates
    ::iteraeting::iterating
    ::itereating::iterating
    ::itearting::iterating
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
    ::itslef::itself

    :C:JAva::Java
    :C:javascritp::javascript       ; with 2 capital letters, this word does not fit AHK's model
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
    :*:jorunal::journal             ; journal/s/ctl/ing
    :*:jounral::journal
    :*:journla::journal
    :*:jouranl::journal
    :*:joruanl::journal
    ::jqueyr::jquery
    ::jqeury::jquery
    ::jqurey::jquery
    ::josn::json
    ::jthraed::jthread              ; C++ joining thread
    ::jsut::just
    ::jsutified::justified
    ::jsutifies::justifies
    ::jsutify::justify

    ::kernle::kernel
    ::keywrod::keyword
    ::keyowrd::keyword
    ::keywrods::keywords
    ::keyowrds::keywords
    ::kikc::kick
    ::kikcs::kicks
    ::kidn::kind
    ::kidns::kinds
    ::knokc::knock
    ::knwo::know
    ::konw::know
    ::nkow::know
    ::konwing::knowing
    ::knwoing::knowing
    ::nkowing::knowing
    ::konwledge::knowledge
    ::knwoledge::knowledge
    ::nkowledge::knowledge
    ::konwn::known
    ::knwon::known
    ::nkown::known
    ::knonw::known
    ::konws::knows
    ::knwos::knows
    ::nkows::knows
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
    ::laetncies::latencies
    ::altencies::latencies
    ::ltaencies::latencies
    ::laetncy::latency
    ::altency::latency
    ::ltaency::latency
    ::latset::latest
    :*:lauchn::launch               ; launch/ed/es/ing
    :*:laucnh::launch
    ::layotu::layout
    ::layotus::layouts
    ::leadre::leader
    ::laeder::leader
    ::laeders::leaders
    ::leadres::leaders
    :*:leran::learn                 ; learn/s/ed/ing
    :*:laern::learn
    :*:lerna::learn
    ::leanr::learn
    ::leanring::learning
    ::leasign::leasing
    ::lesat::least
    ::elft::left
    ::legla::legal
    ::legnth::length
    ::lenght::length
    ::lnegth::length
    ::legnths::lengths
    ::lenghts::lengths
    ::lnegths::lengths
    :C:LEt::Let
    ::let mtu::let mut              ; Rust mutable variable
    ::elt mut::let mut
    ::leter::letter
    ::lettter::letter
    ::leters::letters
    ::lettters::letters
    ::levle::level
    ::levles::levels
    ::lbiraries::libraries
    ::libraires::libraries
    ::librarry::library
    ::lbirary::library
    ::librayr::library
    ::licesne::license
    ::licensign::licensing
    ::liek::like
    :C:like ot::like to
    ::liekly::likely
    ::likeyl::likely
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
    ::ilnk::link
    ::linkaeg::linkage
    ::liknage::linkage
    ::ilnkage::linkage
    ::linekd::linked
    ::likned::linked
    ::ilnked::linked
    ::linekr::linker
    ::likner::linker
    ::ilnker::linker
    ::ilnking::linking
    ::likns::links
    ::ilnks::links
    ::litner::linter
    ::litners::linters
    :C:LInux::Linux
    ::lniux::linux
    ::linxu::linux
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
    :*:lcoal::local                 ; local/ly/ity/ize/ization
    ::lcoation::location
    ::lcoations::locations
    ::logairthm::logarithm
    ::lgoical::logical
    ::loign::login
    ::logpiotn::logpoint
    ::logpiotns::logpoints
    ::lnog::long
    ::logner::longer
    ::lnoger::longer
    ::longets::longest
    ::lognest::longest
    ::lnogest::longest
    :*:looop::loop                  ; loop/s/ed/ing
    ::lsoes::loses
    ::lsot::lost
    ::lto of::lot of
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
    ::mainteance::maintenance
    ::mjaor::major
    ::mjaorly::majorly
    ::mkae::make
    ::maek::make
    :C:amke::make
    ::makefiel::makefile
    ::maeks::makes
    ::amkes::makes
    ::mkaes::makes
    ::mkaing::making
    :*:malfucntion::malfunction     ; malfunction/s/ed/ing
    ::maloc::malloc
    :*:manaeg::manage               ; manage/d/r/rs/ment/eable
    :*:mangae::manage
    :*:maange::manage
    ::mangeld::mangled              ; name mangling
    ::manaul::manual
    ::manaully::manually
    :*:manfactur::manufactur        ; manufactur/ed/er/ing
    ::mnay::many
    ::mapifle::mapfile              ; shell command
    ::maping::mapping
    ::mapings::mappings
    ::marign::margin
    ::margianl::marginal
    ::margainl::marginal
    ::marigns::margins
    ::makrdown::markdown
    ::marekd::marked
    ::maksing::masking
    ::matser::master
    :*:mtach::match                 ; match/ed/es/ing
    :*:amtch::match
    ::matcing::matching
    ::materila::material
    ::materilas::materials
    ::mathmatical::mathematical
    ::mathmatics::mathematics
    ::maltab::matlab
    ::mtalab::matlab
    ::amtrix::matrix
    ::maxiaml::maximal
    ::maxinum::maximum
    ::maximm::maximum
    ::may nto::may not
    ::may ont::may not
    :C:menas::means
    ::measn::means
    ::menat::meant
    ::measureable::measurable
    ::measuer::measure
    ::measruement::measurement
    ::measuerment::measurement
    ::measurment::measurement
    ::measruements::measurements
    ::measurementes::measurements
    ::measuerments::measurements
    ::measurments::measurements
    ::mechnaism::mechanism
    ::mechanims::mechanism
    ::mechnaisms::mechanisms
    ::memberes::members
    ::memoiation::memoization
    :*:memrois::memoris
    :*:memroiz::memoriz             ; memoriz/e/ed/ation
    ::memroy::memory
    ::memoroy::memory
    ::mmeory::memory
    :*:metnion::mention             ; mention/s/ed/ing
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
    ::messaeg::message
    ::messgaed::messaged
    ::mesages::messages
    ::messagse::messages
    ::messageing::messaging
    ::messign::messing
    ::emtadata::metadata
    ::metadadta::metadata
    ::metadat::metadata
    ::metadta::metadata
    ::meatdata::metadata
    :*:mehtod::method               ; method/s/ical/ology
    ::metrci::metric
    ::metirc::metric
    ::metrcis::metrics
    ::metircs::metrics
    ::microsfot::microsoft
    ::midpiotn::midpoint
    ::might nto::might not
    ::might ont::might not
    ::millino::million
    ::millinos::millions
    ::minmal::minimal
    ::miniaml::minimal
    ::mnimize::minimize
    ::mininum::minimum
    ::minmum::minimum
    ::minimm::minimum
    ::minutse::minutes
    ::miscellaenous::miscellaneous
    :*:misclikc::misclick           ; misclick/s/ed/ing
    ::mismtach::mismatch
    ::misraed::misread
    ::mising::missing
    ::missign::missing
    ::mistakse::mistakes
    ::mokc::mock
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
    ::modiyf::modify
    ::omdular::modular
    ::modurla::modular
    ::moduliarty::modularity
    ::moduel::module
    ::modlue::module
    ::omdule::module
    ::moduels::modules
    ::modlues::modules
    ::omdules::modules
    :*:monitro::monitor             ; monitor/s/ed/ing
    :*:montiro::monitor
    ::mroe::more
    ::omre::more
    ::msot::most
    ::motoining::motioning
    ::mosue::mouse
    ::mvoe::move
    ::mvoed::moved
    ::mvoes::moves
    ::movei::movie
    ::moveis::movies
    ::muhc::much
    :*:mjulti::multi                ; multi/ply/plex/process/tasking/threaded
    :*:mltip::multip                ; multip/le/ly/lex/rocess
    :*:mulitp::multip
    :*:mulipt::multip
    ::multipel::multiple
    ::multipels::multiples
    ::multipleid::multiplied
    ::multipleir::multiplier
    ::multply::multiply
    ::multiproceessing::multiprocessing
    ::multiporcessing::multiprocessing
    ::multiprocessign::multiprocessing
    ::mltitask::multitask
    ::multitaks::multitask
    ::multitaksing::multitasking
    ::multithraed::multithread
    ::mltithread::multithread
    ::msut::must
    ::must nto::must not
    ::must ont::must not
    ::mtuex::mutex
    ::mtuexes::mutexes
    ::mutula::mutual

    ::nmae::name
    ::nmaed::named
    ::namelsit::namelist            ; FORTRAN statement
    ::nmaes::names
    ::naems::names
    ::namse::names
    ::namespce::namespace
    ::nmaespace::namespace
    ::namepace::namespace
    ::naemspace::namespace
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
    ::nee dto::need to
    :C:needed ot::needed to
    :C:needs ot::needs to
    ::negligibel::negligible
    ::neigbhor::neighbor
    ::neigbhors::neighbors
    ::niether::neither
    ::neihter::neither
    :*:entwork::network             ; network/s/ed/ing
    ::nerual::neural
    ::neurla::neural
    ::neutrla::neutral
    ::newlien::newline
    ::newliens::newlines
    ::enxt::next
    :C:onde::node
    :C:ndoe::node
    ::ondes::nodes
    ::ndoes::nodes
    ::nosiy::noisy
    :C:NOne::None                   ; Python keyword
    ::nonlcoal::nonlocal            ; Python keyword
    :*:normla::normal               ; normal/ise/ize/izing
    :*:northwset::northwest         ; northwest/ern
    :C:Nto::Not
    :C:NOt::Not
    :C:nto the::not the
    :C:not ot::not to
    ::ntoe::note
    ::ntoed::noted
    ::ntoepad::notepad
    ::ntoes::notes
    ::nohting::nothing
    :*:ntoif::notif                 ; notif/y/ied/ication
    :*:notiif::notifi
    ::notifcation::notification
    ::notifcations::notifications
    ::nulll::null
    ::nulopt::nullopt               ; C++ keyword
    ::nulllopt::nullopt
    ::nulptr::nullptr               ; C++ keyword
    ::nulllptr::nullptr
    ::nubmer::number
    ::nubmers::numbers
    :*:nuemr::numer                 ; numer/al/ic/ator
    ::numerosu::numerous
    ::nmve::nvme

    :*:ojbect::object               ; object/s/ive/ives
    :*:obejct::object
    :*:obesrv::observ               ; observ/e/ed/er/able/ation
    :*:obsolte::obsolete            ; obsolete/d/s
    ::obstalce::obstacle
    ::obstalces::obstacles
    :*:occassion::occasion          ; occasion/s/ally
    ::ocurred::occurred
    ::occured::occurred
    ::ocurrence::occurrence
    ::occurence::occurrence
    ::occurrrence::occurrence
    ::ocurrences::occurrences
    ::occurences::occurrences
    ::occurrrences::occurrences
    ::ofthat::of that
    ::fo that::of that
    ::ofthe::of the
    ::ofteh::of the
    ::ofhte::of the
    ::fo the::of the
    ::oft he::of the
    ::o fthe::of the
    ::ofthis::of this
    ::fo this::of this
    ::offiical::official
    ::offical::official
    ::officailly::officially
    ::offest::offset
    ::odlest::oldest
    ::onthe::on the
    ::o nthe::on the
    ::oens::ones
    ::onlien::online
    :C:ONly::Only
    ::onyl::only
    ::onlly::only
    ::opauqe::opaque
    ::oepn::open
    ::oepned::opened
    ::oepning::opening
    ::opesn::opens
    ::oepns::opens
    :*:oeprat::operat               ; operat/ed/es/or/ion/ional
    :*:opeart::operat
    :*:opereat::operate
    ::operaeting::operating
    :*:opeation::operation          ; operation/al/s
    :*:operaetion::operation
    ::opeator::operator
    ::operaetor::operator
    ::opeators::operators
    ::operaetors::operators
    ::opporutnity::opportunity
    :*:optmi::optim                 ; optim/al/ise/ized
    ::otpimal::optimal
    ::optiaml::optimal
    :*:optizmi::optimiz             ; optimiz/e/ed/es/ation
    ::optimiation::optimization
    ::optiimzation::optimization
    ::optimiations::optimizations
    ::optiimzations::optimizations
    ::optimze::optimize
    ::optimzed::optimized
    ::optimzes::optimizes
    :*:otpion::option               ; option/s/al/ally
    :*:otpino::option
    :C:OPtion::Option               ; Rust optional value
    ::optioal::optional
    ::oralce::oracle
    ::roacle::oracle
    :*:odrer::order                 ; order/s/ed/ing
    ::ordianry::ordinary
    :*:oragnis::organis             ; organis/e/ed/es/ation
    :*:orgnais::organis
    :*:oragniz::organiz
    :*:orgnaiz::organiz
    :*:oritent::orient              ; orient/s/ed/ation
    :*:oreint::orient
    ::oriign::origin
    ::orignal::original
    ::orignial::original
    ::origianl::original
    ::origainl::original
    ::orignially::originally
    ::origainlly::originally
    ::oriigns::origins
    :*:orhto::ortho                 ; ortho/gonal/normal
    :*:ohter::other                 ; other/s/wise
    ::otehrs::others
    ::otehrwise::otherwise
    ::otheriwse::otherwise
    ::otherwies::otherwise
    :C:OUr::Our
    ::otu of::out of
    ::outocme::outcome
    ::outocmes::outcomes
    ::outcomse::outcomes
    ::otuer::outer                  ; exception for '-tuer' -> '-ture'
    ::outlien::outline
    ::outliens::outlines
    ::otuput::output
    ::ouptut::output
    ::outptu::output
    ::otuputs::outputs
    ::ouptuts::outputs
    ::outpust::outputs
    ::outptus::outputs
    ::ovearll::overall
    :*:overlfow::overflow           ; overflow/s/ed/ing
    :*:overflwo::overflow
    ::overhaed::overhead
    ::overalp::overlap
    ::overiden::overridden
    ::overidden::overridden
    ::overriden::overridden
    ::overide::override
    ::overides::overrides
    ::oveview::overview
    :*:overwheml::overwhelm         ; overwhelm/s/ed/ing
    :*:overhwelm::overwhelm
    ::overwrtie::overwrite
    ::overwirte::overwrite
    ::overwrties::overwrites
    ::overwirtes::overwrites
    ::onwer::owner
    ::owenr::owner
    ::onwers::owners
    ::owenrs::owners
    ::onwership::ownership
    ::owenrship::ownership

    ::pakc::pack
    :*:pacakge::package             ; package/d/r/s
    :*:packge::package
    :*:pakcage::package
    :*:packaeg::package
    :*:packgae::package
    ::pakcaging::packaging
    :C:apge::page
    ::paeg::page
    ::apged::paged
    ::apges::pages
    ::paitner::painter
    ::paitners::painters
    :*:apir<::pair<                 ; C++ template container
    :*:pari<::pair<
    ::palindrmoe::palindrome
    ::palindrmoes::palindromes
    ::paenl::panel
    ::paenls::panels
    :*:paralel::parallel            ; parallel/s/ise/ism/ize
    :*:parllel::parallel
    :*:aprallel::parallel
    :*:parlalel::parallel
    :*:praallel::parallel
    ::parallelsim::parallelism
    :*:pareamter::parameter         ; parameter/s/ise/ize/isation/ization
    :*:paraemter::parameter
    :*:parameer::parameter
    :*:parmaeter::parameter
    :*:aprameter::parameter
    :*:paramter::parameter
    :*:paramteer::parameter
    :*:apramter::parameter
    :*:parmater::parameter
    :*:paremter::parameter
    :*:parametre::parameter
    ::parameteres::parameters
    ::praent::parent
    ::aprent::parent
    ::parentehses::parentheses
    ::praents::parents
    ::parenets::parents
    ::aprents::parents
    ::parofr::parfor                ; MATLAB parallel loop
    :*:pasre::parse                 ; parse/d/s/r
    ::parsign::parsing
    ::parital::partial
    ::partailly::partially
    ::paritally::partially
    :*:paritc::partic               ; partic/ular/ipant/ipate
    ::participnat::participant
    ::participnats::participants
    ::parituclar::particular
    ::partiuclar::particular
    :*:partiton::partition          ; partition/s/ed/ing
    :*:parittion::partition
    :*:parition::partition
    ::partitoined::partitioned
    ::partitoining::partitioning
    :*:partenr::partner             ; partner/s/ed/ing/ship
    ::passaeg::passage
    ::passsed::passed
    ::passses::passes
    ::passign::passing
    ::passsing::passing
    ::pasive::passive
    ::passwrod::password
    ::pasword::password
    ::passowrd::password
    ::passwrods::passwords
    ::paswords::passwords
    ::passowrds::passwords
    ::patse::paste
    ::patses::pastes
    ::paht::path
    ::pahtlib::pathlib
    ::pahtname::pathname
    ::pahts::paths
    ::apttern::pattern
    ::patern::pattern
    ::aptterns::patterns
    ::paterns::patterns
    ::pasuing::pausing
    ::pausign::pausing
    ::pyament::payment
    ::pyaments::payments
    ::pedatnic::pedantic
    ::peopel::people
    :*:percenet::percent            ; percent/s/age/ile
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
    ::perimssion::permission
    ::perimssions::permissions
    ::perimt::permit
    ::perimts::permits
    ::perimtted::permitted
    ::permited::permitted
    ::permtuation::permutation
    ::pemrutation::permutation
    :*:permtue::permute             ; permute/d/s
    :*:pemrute::permute
    ::perpendiuclar::perpendicular
    :*:persit::persist              ; persist/s/ed/ent/ing
    ::persistant::persistent
    ::peristent::persistent
    ::persistnet::persistent
    :*:perosn::person               ; person/al/nel/alize
    ::persepctive::perspective
    ::persepctives::perspectives
    ::pertubation::perturbation
    ::pgrpe::pgrep                  ; process grep
    ::phaess::phases
    ::phoen::phone
    ::phoens::phones
    ::phsyical::physical
    ::pikc::pick
    ::pikcs::picks
    ::pipelien::pipeline
    ::pipeilne::pipeline
    ::piepline::pipeline
    ::pipeliens::pipelines
    ::pipeilnes::pipelines
    ::pieplines::pipelines
    ::pixesl::pixels
    ::palced::placed
    ::placehodler::placeholder
    ::placehodlers::placeholders
    ::palcement::placement
    ::palces::places
    ::paln::plan
    :C:plna::plan
    ::palne::plane
    ::plnae::plane
    ::palnes::planes
    ::plnaes::planes
    ::palnned::planned
    ::planend::planned
    ::palnning::planning
    ::palns::plans
    :C:plnas::plans
    ::platfom::platform
    ::paltform::platform
    ::platfoms::platforms
    ::paltforms::platforms
    ::playesr::players
    ::playlsit::playlist
    ::playlsits::playlists
    ::pleaes::please
    ::pelase::please
    ::plto::plot
    ::pltos::plots
    ::pluign::plugin
    ::pulgin::plugin
    ::pluigns::plugins
    ::plugisn::plugins
    ::pulgins::plugins
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
    ::populiarty::popularity
    :*:popualt::populat             ; populat/ed/es/ion
    ::postion::position
    :*:opsition::position           ; position/s/ing
    ::positoining::positioning
    ::postions::positions
    ::posible::possible
    ::posisble::possible
    ::possibel::possible
    :*:pwoer::power                 ; power/s/ed/point/shell
    :*:opwer::power
    ::powerpiotn::powerpoint
    ::ppritn::pprint                ; Python pretty printer
    ::pratice::practice
    ::praticed::practiced
    ::pratices::practices
    ::praticing::practicing
    ::prgama::pragma                ; #pragma
    :*:prealocate::preallocate      ; preallocate/d/s
    :*:preallcoate::preallocate
    :*:precuation::precaution       ; precaution/s/ary
    :*:preceede::precede            ; precede/d/s/nce/nts
    ::preicsion::precision
    :*:preocmput::precomput         ; precomput/e/ed/es/ing
    ::predecssor::predecessor
    ::predecesor::predecessor
    ::rpedicate::predicate          ; function returing true/false
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
    :*:prpear::prepar               ; prepar/e/ed/es/ation
    :*:preprae::prepare
    :*:preporcess::preprocess       ; preprocess/es/or/ing
    :*:preproceess::preprocess
    ::preprocessign::preprocessing
    ::preprocesor::preprocessor
    :*:presetn::present             ; present/s/ed/er/ers/ation
    :*:prserve::preserve            ; preserve/d/r/s
    ::pressign::pressing
    :*:prevetn::prevent             ; prevent/s/ed/ion/able
    :*:prvent::prevent
    :*:prevenet::prevent
    ::preivous::previous
    ::primarly::primarily
    ::primarliy::primarily
    ::pirmary::primary
    ::priamry::primary
    ::priemr::primer
    ::primiive::primitive
    :*:prinicp::princip             ; princip/al/le/ally
    ::pritn::print
    ::pirnt::print
    ::pritnable::printable
    ::pirntable::printable
    ::pritner::printer
    ::pirnter::printer
    ::pritners::printers
    ::pirnters::printers
    ::pritnf::printf
    ::pirnting::printing
    ::pritnln::println
    ::pritns::prints
    ::pirnts::prints
    ::priorty::priority
    ::priotrity::priority
    ::prioirty::priority
    ::pirority::priority
    ::privte::private
    ::probablistic::probabilistic
    :*:probelm::problem             ; problem/s/atic
    :*:problme::problem
    :*:prblem::problem
    :*:porblem::problem
    :*:rpoblem::problem
    ::problesm::problems
    :*:proceudr::procedur           ; procedur/e/al/es/ally
    :*:proecdur::procedur
    ::procedurla::procedural
    :*:proceess::process            ; process/es/or/ing
    :*:porcess::process
    ::processesd::processed
    ::proceses::processes
    ::procesing::processing
    ::processign::processing
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
    :*:produtc::product
    :*:proflie::profile             ; profile/d/s/r
    :*:profiel::profile
    :*:prgoram::program             ; program/s/med/ming/mable/matic
    :*:porgram::program
    :*:progrma::program
    :*:progarm::program
    ::programable::programmable
    ::programatic::programmatic
    ::programing::programming
    ::progressign::progressing
    :*:proejct::project             ; project/s/ed/ing/ion
    :*:prjoect::project
    ::proliifc::prolific
    ::pormise::promise
    ::proimse::promise
    ::promisign::promising
    ::proofign::proofing
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
    ::prvoe::prove
    ::prvoed::proved
    ::prvoes::proves
    ::provdie::provide
    ::provdied::provided
    ::provdier::provider
    ::provdiers::providers
    ::providres::providers
    ::provdies::provides
    ::provisoined::provisioned
    ::provisoining::provisioning
    ::proxiimty::proximity
    ::pruen::prune                  ; git prune
    :C:purne::prune
    :*:pesudo::pseudo               ; pseudo/code/random
    :*:psuedo::pseudo
    ::pubilc::public
    ::pubicl::public
    ::publicyl::publicly
    :*:publihs::publish             ; publish/ed/er/es/ing
    :*:pubilsh::publish
    ::upll::pull
    ::uplled::pulled
    ::uplling::pulling
    ::uplls::pulls
    ::purchaesr::purchaser
    ::purchaesrs::purchasers
    ::puhs::push
    :C:upsh::push
    ::pytets::pytest
    ::pythno::python
    ::pyton::python
    ::pythohn::python
    :C:PYthon::Python
    ::pyhton::python
    ::pytohn::python
    ::pythyon::python
    ::pytyhon::python
    ::pytyon::python

    ::qualyit::quality
    :*:quatn::quant                 ; quant/um/ify/ity/itative
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
    :*:queyr::query                 ; query/ing/Args/Parameters
    :*:qeury::query
    :*:qurey::query
    :*:uqeyr::query
    ::qury::query
    :*:qeust::quest                 ; quest/ion/ions/ioning
    :*:quset::quest
    :*:quets::quest
    :*:qustion::question            ; question/s/ed/ing/able
    :*:quetion::question
    ::queu::queue
    ::qeuue::queue
    ::qeueu::queue
    ::qeue::queue
    ::queeu::queue
    ::qeueue::queue
    ::quue::queue
    ::quuee::queue
    ::queud::queued
    ::qeuued::queued
    ::qeueud::queued
    ::qeued::queued
    ::queeud::queued
    ::qeueued::queued
    ::quued::queued
    ::quueed::queued
    ::queus::queues
    ::qeuues::queues
    ::qeueus::queues
    ::qeues::queues
    ::queeus::queues
    ::qeueues::queues
    ::quues::queues
    ::quuees::queues
    :*:qiuck::quick                 ; quick/er/ly/sort/select
    :*:quikc::quick
    ::quickyl::quickly
    ::quicly::quickly
    ::quicksleect::quickselect

    ::rakc::rack
    ::riase::raise
    ::riased::raised
    ::riases::raises
    ::raisign::raising
    :*:ranodm::random               ; random/ly/ise/ize/ization
    :*:rnadom::random
    :*:rnaodm::random
    ::randomiezr::randomizer
    ::rnage::range
    :C:ragne::range
    ::rnaged::ranged
    ::ragned::ranged
    ::rnages::ranges
    ::ragnes::ranges
    :C*:ranges`:`;::ranges`:`:      ; 'ranges:;' -> 'ranges::'. C++ namespace
    :C*:rangeS`:`:::ranges`:`:      ; 'rangeS::' -> 'ranges::'
    :C*:ranges`;`:::ranges`:`:      ; 'ranges;:' -> 'ranges::'
    :C*:ranges`;`;::ranges`:`:      ; 'ranges;;' -> 'ranges::'
    ::ragning::ranging
    ::rtaio::ratio
    ::raech::reach
    ::raeched::reached
    ::raeches::reaches
    ::raeching::reaching
    ::readres::readers
    ::raeding::reading
    ::raedy::ready
    ::realsm::realms
    :*:reaosn::reason               ; reason/s/ed/ing/able
    :*:resaon::reason
    ::reasonalby::reasonably
    ::reblance::rebalance
    :*:reblaance::rebalance         ; rebalance/d/r/s/rs
    ::rebasign::rebasing
    ::rebulid::rebuild
    ::rebiuld::rebuild
    ::rebulids::rebuilds
    ::rebiulds::rebuilds
    :*:reciev::receiv               ; receiv/e/ed/er/ing/able
    ::receivs::receives
    ::recnet::recent
    ::recenet::recent
    ::recenetly::recently
    :*:recognies::recognise         ; recognise/s/ed/er
    :*:recogniez::recognize         ; recognize/s/ed/er
    :*:recommned::recommend         ; recommend/s/ed/ation
    :*:reocmpil::recompil           ; recompil/e/ed/es/ation
    :*:recomipl::recompil
    ::reconcileable::reconcilable
    :*:reconect::reconnect          ; reconnect/s/ed/ing
    ::recrod::record
    ::recroded::recorded
    ::recroding::recording
    ::recrods::records
    ::recrutier::recruiter
    ::recrutiers::recruiters
    :*:rectnagle::rectangle         ; rectangle/s
    :*:recntagle::rectangle
    :*:rectangel::rectangle
    :*:rectnagel::rectangle
    :*:recusri::recursi             ; recursi/ve/on/ng/vely
    :*:recuris::recursi
    ::recursign::recursing
    ::recycel::recycle
    ::recyceld::recycled
    ::recycels::recycles
    :*:redefien::redefine           ; redefine/d/s
    :*:redesing::redesign           ; redesign/s/ed/ing
    :*:reudce::reduce               ; reduce/d/r/s
    :*:redcue::reduce
    ::reudction::reduction
    ::reudctions::reductions
    ::redundnat::redundant
    :*:refator::refactor            ; refactor/s/ed/ing
    :*:refacotr::refactor
    :*:refernce::reference          ; reference/d/s
    :*:refrence::reference
    :*:erference::reference
    ::refrencing::referencing
    ::referncing::referencing
    ::referal::referral
    ::referals::referrals
    ::refersh::refresh
    ::refershed::refreshed
    ::refershes::refreshes
    ::regarldess::regardless
    :*:registser::register          ; register/s/ed/ing
    :*:reigster::register
    ::registires::registries
    ::registyr::registry
    ::regressign::regressing
    ::regresion::regression
    ::regresions::regressions
    ::reuglar::regular
    :*:regualte::regulate           ; regulate/d/s
    ::reimaeg::reimage
    ::reinforcment::reinforcement
    :*:reintall::reinstall          ; reinstall/ed/er/ation
    :*:reinstsall::reinstall
    :*:reintsall::reinstall
    :*:reinstlal::reinstall
    :*:reinterperet::reinterpret    ; reinterpret/s/ed/er/ing/ation
    :*:reinterpert::reinterpret
    :*:reintrepret::reinterpret
    ::rleate::relate
    ::realte::relate
    ::rleated::related
    ::realted::related
    ::rleates::relates
    ::realtes::relates
    :*:relait::relati               ; relati/ng/on/ve/onship
    :*:rleation::relation           ; relation/s/al/ship
    :*:releation::relation
    :*:realtion::relation
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
    ::releaesr::releaser
    ::releaesrs::releasers
    ::releaess::releases
    ::releasign::releasing
    ::relevnat::relevant
    :*:remian::remain               ; remain/s/ed/der/ing
    :*:remina::remain
    ::remaiing::remaining
    ::remaning::remaining
    ::remkae::remake
    ::remaek::remake
    ::remaeks::remakes
    ::remkaes::remakes
    ::remnnat::remnant
    ::remtoe::remote
    ::remtoely::remotely
    ::remotley::remotely
    ::removeal::removal
    :*:rmeove::remove               ; remove/d/r/s
    :*:remvoe::remove
    :*:reomve::remove
    :*:rmoeve::remove
    :*:renmae::rename               ; rename/d/s
    :*:renaem::rename
    ::rednered::rendered
    ::rednering::rendering
    ::reepat::repeat                ; Lua keyword
    ::reepated::repeated
    ::reepatedly::repeatedly
    ::repetaedly::repeatedly
    ::repating::repeating
    ::repaeting::repeating
    ::reepats::repeats
    ::repeelm::repelem              ; MATLAB function
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
    ::repamt::repmat                ; MATLAB function
    :*:reoprt::report               ; report/s/ed/er/ing
    ::reposistories::repositories
    ::reopsitories::repositories
    ::repostiories::repositories
    ::repositrories::repositories
    ::reposotires::repositories
    ::repostiries::repositories
    ::repsotiries::repositories
    ::respositories::repositories
    ::repostiroy::repository
    ::repositoroy::repository
    ::reposistory::repository
    ::reopsitory::repository
    ::repositroy::repository
    ::repostiory::repository
    ::respository::repository
    :*:represnet::represent         ; represent/s/ed/ing/ation
    :*:reprsent::represent
    :*:represnt::represent
    :*:reprodcue::reproduce         ; reproduce/d/s
    :*:requst::request              ; request/s/ed/ing
    :*:reqeust::request
    :*:rquest::request
    :*:reuqest::request
    :*:rqeust::request
    :*:reuest::request
    :*:requset::request
    ::requets::request
    ::requesets::requests
    :*:reuqire::require             ; require/d/s/ment
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
    ::rservation::reservation
    ::rservations::reservations
    ::rserve::reserve
    ::resrve::reserve
    ::rserved::reserved
    ::resrved::reserved
    ::rserves::reserves
    ::resrves::reserves
    :*:rehsape::reshape             ; MATLAB function
    :*:rehspae::reshape
    ::reisded::resided
    ::residnet::resident
    ::residnets::residents
    ::residaul::residual
    ::resileincy::resiliency
    ::reisliency::resiliency
    ::reislient::resilient
    :*:reisze::resize               ; resize/d/r/s
    :*:resiez::resize
    :*:reszie::resize
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
    :*:respnos::respons             ; respons/e/ive/ible
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
    ::restrated::restarted
    ::restrating::restarting
    ::restrats::restarts
    ::restarst::restarts
    ::restokc::restock
    :*:restirct::restrict           ; restrict/s/ed/ing/ion
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
    :*:ruelst::result
    :C:REsult::Result               ; Rust data type
    ::reults::results
    ::resulst::results
    ::resuem::resume
    ::resuemd::resumed
    ::resuems::resumes
    ::retian::retain
    ::retians::retains
    :*:retreiv::retriev             ; retriev/e/al/er/able
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
    :*:retur n::return `            ; ex: 'retur ntrue' ('`' used to add trailing space)
    ::returnd::returned
    ::returend::returned
    ::reurned::returned
    ::reurning::returning
    ::retursn::returns
    ::reurns::returns
    :C:ruese::reuse
    ::ruesed::reused
    ::rueses::reuses
    ::reusign::reusing
    ::ruesing::reusing
    ::revesre::reverse
    ::revesred::reversed
    ::revesres::reverses
    ::reversign::reversing
    :*:reivew::review               ; review/s/ed/er/ing
    :*:reveiw::review
    ::revisign::revising
    ::reivsion::revision
    ::reivsions::revisions
    :*:reviist::revisit             ; revisit/s/ed/ing
    :*:reawrd::reward               ; reward/s/ed/ing
    :*:rewtach::rewatch             ; rewatch/ed/ing
    ::rewriet::rewrite              ; COBOL statement
    ::rewirte::rewrite
    ::rewrtie::rewrite
    :*:rigth::right                 ; right/s/Child
    :*:rihgt::right
    :*:irght::right
    :*:rigiht::right
    :*:righit::right
    ::rigorosu::rigorous
    ::risign::rising
    ::rolback::rollback
    ::orund::round
    ::orunded::rounded
    ::orunds::rounds
    ::rotue::route
    ::rotuer::router                ; exception for -tuer  -> -ture
    ::rotuers::routers              ; exception for -tuers -> -tures
    ::rotues::routes
    ::routien::routine
    ::routein::routine
    ::rotuine::routine
    ::routiens::routines
    ::routeins::routines
    ::rotuines::routines
    :C:ruel::rule
    ::rueld::ruled
    ::ruels::rules
    ::runenr::runner
    ::runenrs::runners
    ::runing::running
    :C:rusn::runs
    :C:RUst::Rust
    ::rsut::rust

    ::sakc::sack
    ::sfae::safe
    :C:saef::safe
    ::sfaely::safely
    ::saefly::safely
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
    :*:satuart::saturat             ; saturat/e/s/ed/ing
    ::svae::save
    ::svaed::saved
    ::svaes::saves
    ::svaing::saving
    ::scaleable::scalable
    ::saclable::scalable
    ::sacling::scaling
    ::sclaing::scaling
    ::scneario::scenario
    ::scneairo::scenario
    ::scnearios::scenarios
    ::scneairos::scenarios
    :*:scheudl::schedul             ; schedul/e/ed/er/es/ing
    :*:schedlu::schedul
    :*:shcedul::schedul
    ::scheduelr::scheduler
    ::shcema::schema
    ::schmea::schema
    ::shcmea::schema
    ::sicence::science
    ::sicnece::science
    ::sicences::sciences
    ::sicneces::sciences
    ::scientiifc::scientific
    ::socpe::scope
    ::scoep::scope
    ::socped::scoped
    ::scoepd::scoped
    ::socpes::scopes
    ::scoeps::scopes
    ::scroe::score
    ::scroes::scores
    ::scraepr::scraper
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
    ::seucre::secure
    ::secuirty::security
    ::secrutiy::security
    ::seucrity::security
    ::seeign::seeing
    ::seenig::seeing
    ::segfautl::segfault
    :*:sleect::select               ; select/s/ion/ions
    :*:seelct::select
    ::select * form::select * from  ; common sql selection
    ::selectes::selects
    :C:slef::self                   ; current class instance
    :C:eslf::self
    ::sematnic::semantic
    ::sematnics::semantics
    ::sendres::senders
    :C:SendINput::SendInput         ; AutoHotkey function
    ::sensign::sensing
    ::senstivity::sensitivity
    ::setnence::sentence
    ::senetnce::sentence
    ::setnences::sentences
    ::senetnces::sentences
    :*:seaprat::separat             ; separat/e/ed/es/ion/ors
    ::seprate::separate
    ::seprated::separated
    ::seprates::separates
    ::sepration::separation
    ::separtor::separator
    ::separtors::separators
    :*:seuqen::sequen               ; sequen/ce/ces/cing/tial
    :*:seqeuen::sequen
    :*:seqeun::sequen
    ::seuqnce::sequence
    ::sequnce::sequence
    ::seuqnces::sequences
    ::sequnces::sequences
    ::sequentailly::sequentially
    ::serila::serial
    ::serliase::serialise
    ::serliased::serialised
    ::serliases::serialises
    ::serliaze::serialize
    ::serliazed::serialized
    ::serialiezr::serializer
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
    ::shall ont::shall not
    ::shaep::shape
    ::shpae::shape
    ::shaepd::shaped
    ::shpaed::shaped
    ::shaeps::shapes
    ::shpaes::shapes
    :*:hsard::shard                 ; shard/s/ed/ing
    ::shareded::sharded
    ::shrae::share
    ::hsare::share
    ::sahred::shared
    ::hsared::shared
    ::shaerd::shared
    ::shraed::shared
    :*:shfit::shift                 ; shift/s/ed/ing
    ::shrot::short
    ::shrotcut::shortcut
    ::shortctu::shortcut
    ::shortuct::shortcut
    ::shortctus::shortcuts
    ::shortucts::shortcuts
    ::shroten::shorten
    ::shroter::shorter
    ::shrotest::shortest
    ::shrots::shorts
    ::shrotstat::shortstat          ; git flag
    ::shoud::should
    ::shoudl::should
    ::hsould::should
    ::shuld::should
    ::hsoudl::should
    ::should nto::should not
    ::should ont::should not
    ::shoudn't::shouldn't
    ::shoudln't::shouldn't
    ::hsouldn't::shouldn't
    ::shuldn't::shouldn't
    ::shouldnt'::shouldn't
    ::hsow::show
    ::shwo::show
    :C:SHow::Show
    ::hsowed::showed
    ::hsowing::showing
    ::shwoing::showing
    ::hsown::shown
    ::hsows::shows
    ::shwos::shows
    ::shirnk::shrink
    ::shirnking::shrinking
    ::shirnks::shrinks
    ::sidewyas::sideways
    :*:signla::signal               ; signal/s/ed/er/ing
    ::sigend::signed
    ::sigenr::signer
    ::significnat::significant
    ::significatn::significant
    ::significnatly::significantly
    ::significatnly::significantly
    ::ismilar::similar
    ::simlar::similar
    ::simila rto::similar to
    ::similarty::similarity
    ::simlarity::similarity
    ::similiarty::similarity
    ::simpelr::simpler
    ::simplifes::simplifies
    :*:simualte::simulate           ; simulate/d/s
    ::simulatenous::simultaneous
    ::simultaenous::simultaneous
    ::simulatneous::simultaneous
    ::simultaenously::simultaneously
    ::simulatneously::simultaneously
    ::sicne::since
    ::signle::single
    ::singel::single
    ::signleton::singleton
    ::singelton::singleton
    :C:isze::size
    ::siez::size
    ::szie::size
    ::sie of::size of
    :C:sizet::size_t                ; C++ data type
    :C:size_T::size_t
    :C:size-t::size_t
    ::iszed::sized
    ::szied::sized
    ::sieof::sizeof
    ::iszes::sizes
    ::siezs::sizes
    ::szies::sizes
    ::slakc::slack
    ::slwo::slow
    ::slwoer::slower
    ::slwoest::slowest
    ::samll::small
    ::samller::smaller
    ::smalelst::smallest
    ::smoohting::smoothing
    ::snaphsot::snapshot
    ::snaphsots::snapshots
    ::s oit::so it
    ::osftware::software
    ::sofware::software
    ::soltion::solution
    ::oslution::solution
    ::soltions::solutions
    ::oslutions::solutions
    ::sovlable::solvable
    :*:sovle::solve                 ; solve/d/r/s/rs
    ::solev::solve
    ::sovling::solving
    ::smoe::some
    ::osme::some
    :C:soem::some
    :C:Soem::Some
    :C:SOme::Some                   ; Rust data type
    ::soemhow::somehow
    ::soemone::someone
    ::somehing::something
    ::smoething::something
    ::osmething::something
    ::somehting::something
    ::someting::something
    ::soemthing::something
    ::osmetime::sometime
    ::soemtime::sometime
    ::osmetimes::sometimes
    ::soemtimes::sometimes
    ::soemwhere::somewhere
    :C:SOrt::Sort
    ::srotable::sortable
    ::osrtable::sortable
    ::sortd::sorted
    ::sroted::sorted
    ::osrted::sorted
    ::sroting::sorting
    ::osrting::sorting
    ::srots::sorts
    ::osrts::sorts
    ::soruce::source
    ::soruces::sources
    ::sorucing::sourcing
    ::sprase::sparse
    ::spwaned::spawned
    ::spawend::spawned
    ::spawsn::spawns
    ::speical::special
    :*:speicfi::specifi             ; specifi/c/ed/ier/iers/cally
    :*:speicif::specifi
    :*:speciifc::specific           ; specific/s/ied/ally/ation
    :*:speciific::specific
    ::speicfy::specify
    ::speciyf::specify
    ::specifiy::specify
    ::specualtive::speculative
    ::spetn::spent
    ::spontaenous::spontaneous
    ::spontaenously::spontaneously
    ::sproadic::sporadic
    ::sproadically::sporadically
    ::spraeds::spreads
    ::spraedsheet::spreadsheet
    ::spradsheet::spreadsheet
    ::spraedsheets::spreadsheets
    ::spradsheets::spreadsheets
    :*:spritn::sprint               ; sprint/f/s/ed/ing
    ::sqltie::sqlite
    ::slqite::sqlite
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
    :*:stakc::stack                 ; stack/s/ed/ing/able
    :*:satck::stack
    ::staffign::staffing
    ::stmap::stamp
    ::stnad::stand
    ::stnadard::standard
    ::stnadards::standards
    ::stnading::standing
    ::stnads::stands
    ::stnadup::standup
    :C:strating::starting
    ::stahs::stash                  ; git stash
    ::stsah::stash
    :*:staet::state                 ; state/d/s/ful/less/ment
    ::staic::static
    ::sttaic::static
    ::sttaus::status
    ::styas::stays
    :C*:std:`;::std`:`:             ; C++ standard namespace. Use '`' to escape ':' and ';'
                                    ; Use '*' to match anywhere b/c there is no ending char after 'std::'
                                    ; 'std:;' -> 'std::'
    :C*:sdt`:`:::std`:`:            ; 'sdt::' -> 'std::'
    :C*:sdt:`;::std`:`:             ; 'sdt:;' -> 'std::'
    :C*:stD`:`:::std`:`:            ; 'stD::' -> 'std::'
    :C*:std`;`:::std`:`:            ; 'std;:' -> 'std::'
    :C*:std`;`;::std`:`:            ; 'std;;' -> 'std::'
    ::stepepd::stepped
    ::stepepr::stepper
    ::stesp::steps
    ::setps::steps
    ::stikc::stick
    ::stikcs::sticks
    ::stikcy::sticky
    ::stokc::stock
    :C:sotp::stop
    ::stoppaeg::stoppage
    ::sotps::stops
    ::stopwtach::stopwatch
    ::stopawtch::stopwatch
    ::stoarge::storage
    ::stoage::storage
    ::stroage::storage
    ::storeage::storage
    ::tsorage::storage
    ::sotrage::storage
    :C:stroe::store
    ::tsore::store
    :C:sotre::store
    ::tsored::stored
    ::stroes::stores
    ::tsores::stores
    :*:striaght::straight           ; straight/s/en/er/forward
    :*:stragiht::straight
    ::stragne::strange
    ::streategy::strategy
    ::strema::stream
    ::straem::stream
    ::steram::stream
    ::stremaed::streamed
    ::straemed::streamed
    ::steramed::streamed
    ::stremaing::streaming
    ::straeming::streaming
    ::steraming::streaming
    ::stremas::streams
    ::straems::streams
    ::sterams::streams
    :*:strenght::strength           ; strength/en/ens/ened/ening
    ::stressign::stressing
    ::striek::strike
    :*:sring::string                ; string/s/ent/ify
    :*:stirng::string
    :*:tsring::string
    :*:stinrg::string
    ::stringstraem::stringstream
    ::storng::strong
    ::stornger::stronger
    ::storngest::strongest
    ::stuct::struct
    :*:strcut::struct               ; struct/s/ure/ured/eres
    :*:sturct::struct
    :*:strutur::structur            ; structur/e/al/ed/es
    :*:structcur::structur
    :*:strucutr::structur
    ::structurla::structural
    ::structre::structure
    ::stukc::stuck
    ::stuido::studio
    ::stuidos::studios
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
    ::subclasing::subclassing
    ::subclassign::subclassing
    ::submisosin::submission
    ::submisosins::submissions
    ::submtited::submitted
    ::submoduel::submodule
    ::submoduels::submodules
    ::subporcess::subprocess
    ::subroutien::subroutine
    ::subroutein::subroutine
    ::subroutiens::subroutines
    ::subrouteins::subroutines
    :*:subcribe::subscribe          ; subscribe/d/r/s
    ::subscritp::subscript          ; Swift keyword
    ::subscirpt::subscript
    ::subseuqnce::subsequence
    ::subsequnce::subsequence
    ::subseuqnces::subsequences
    ::subsequnces::subsequences
    ::subseuqent::subsequent
    ::subsequenet::subsequent
    ::subseuqently::subsequently
    ::subsequnetly::subsequently
    ::substitue::substitute
    ::substittue::substitute
    ::substtitue::substitute
    ::subsring::substring
    ::subsstring::substring
    ::subsrings::substrings
    ::subsstrings::substrings
    :*:subsytem::subsystem          ; subsystem/s
    :*:subysstem::subsystem
    :*:subsysetm::subsystem
    :*:subsyetm::subsystem
    :*:subystem::subsystem
    :*:subssytem::subsystem
    ::subtaks::subtask
    ::subract::subtract
    ::subracted::subtracted
    ::subraction::subtraction
    ::subracts::subtracts
    :*:suceed::succeed              ; succeed/s/ed/ing
    :*:sucess::success              ; success/or/ful/ive/fully
    ::succes::success
    ::succesful::successful
    ::successfuly::successfully
    ::succesfully::successfully
    ::succesor::successor
    :C:usch::such
    ::suhc::such
    ::suc has::such as
    :C:suod::sudo
    ::sufficinetly::sufficiently
    ::suggets::suggest
    ::sutie::suite                  ; test suite
    ::suties::suites
    ::sumarize::summarize
    ::sumary::summary
    :*:suepr::super                 ; super/class/vised/script
    ::superscritp::superscript
    ::superscirpt::superscript
    ::superivsed::supervised
    ::superivses::supervises
    ::suppleid::supplied
    :*:suport::support              ; support/s/ed/ing/ive
    :*:uspport::support
    ::supporst::supports
    :*:supperss::suppress           ; suppress/ed/es/ing/ion
    ::suppressign::suppressing
    ::surfcae::surface
    :*:surorund::surround           ; surround/s/ed/ing
    :C:sawp::swap
    :*:siwthc::switch               ; switch/ed/es/ing/case
    :*:siwtch::switch
    :*:swich::switch
    :*:swtich::switch
    :*:swithc::switch
    :*:swtihc::switch
    ::sycn::sync
    :*:synchor::synchro             ; synchro/nous/nized/nously
    :*:syncrho::synchro
    :*:sycnhro::synchro
    ::synchroniation::synchronization
    ::synchrnous::synchronous
    ::synchrnously::synchronously
    ::sytnax::syntax
    ::sytnaxes::syntaxes
    :*:syntheisze::synthesize       ; synthesize/d/s
    :*:synthesiez::synthesize
    :*:syntheszie::synthesize
    :*:sytsem::system               ; system/d/s/ic/atic
    :*:ssytem::system
    :*:sytem::system
    :*:sysetm::system
    :*:systme::system
    :*:sytesm::system
    ::sysem::system
    ::sysems::systems

    ::tbales::tables
    ::tkae::take
    ::tkaen::taken
    ::takne::taken
    ::taekn::taken
    :C:takse::takes
    ::taeks::takes
    ::tkaes::takes
    :C:tlak::talk
    ::tlaked::talked
    ::tlaker::talker
    ::tlaking::talking
    ::tlaks::talks
    ::tangeld::tangled
    :*:traget::target               ; target/s/ed/er/ing
    :C:taks::task
    ::taksed::tasked
    ::takss::tasks
    ::tcpdupm::tcpdump
    ::taech::teach
    ::taeches::teaches
    ::taeching::teaching
    ::teradown::teardown
    :*:tehcn::techn                 ; techn/ical/ique/ology
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
    ::tempfiel::tempfile            ; Python module
    ::templae::template
    ::tem[late::template
    ::temlate::template
    ::tempalet::template
    ::tempalte::template
    ::templaed::templated
    ::tem[lated::templated
    ::temlated::templated
    ::tempaletd::templated
    ::tempalted::templated
    ::templaes::templates
    ::temlates::templates
    ::tempalets::templates
    ::tempaltes::templates
    ::tempoarl::temporal
    ::temporarliy::temporarily
    ::tempoarry::temporary
    ::temoprary::temporary
    ::temporayr::temporary
    ::temporray::temporary
    ::tneancies::tenancies
    ::tneancy::tenancy
    ::temrinal::terminal
    ::termianl::terminal
    ::termainl::terminal
    ::temrinals::terminals
    ::termianls::terminals
    ::termainls::terminals
    ::termiante::terminate
    ::termianted::terminated
    ::termiantes::terminates
    :C:tets::test
    ::tetsability::testability
    ::tetsable::testable
    ::testcaes::testcase
    ::tetser::tester
    ::tetsers::testers
    ::testse::tests
    ::textula::textual
    ::texutal::textual
    ::htan::than
    :C:tahn::than
    ::thna::than
    ::tjhan::than
    ::htat::that
    ::taht::that
    ::thta::that
    :C:THat::That
    ::thjat::that
    ::tha tis::that is
    ::tha tit::that it
    ::tha tthe::that the
    ::tha twas::that was
    :C:hte::the
    :C:teh::the
    :C:Teh::The
    ::thte::the
    ::tjhe::the
    :C:THe::The
    ::thje::the
    ::hteir::their
    ::theri::their
    ::thier::their
    ::htem::them
    ::theem::theme
    ::hteme::theme
    ::theems::themes
    ::htemes::themes
    ::hten::then
    :C:THen::Then
    ::thne::then
    ::the nthe::then the
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
    ::thigns::things
    ::tihngs::things
    ::thnigs::things
    ::thgins::things
    ::thikn::think
    ::htink::think
    ::tihnk::think
    ::htinking::thinking
    ::tihnking::thinking
    ::thikns::thinks
    ::htinks::thinks
    ::tihnks::thinks
    ::htird::third
    ::thidr::third
    ::thsi::this
    ::htis::this
    ::tihs::this
    :C:THis::This
    :C:tsih::this
    ::thjis::this
    ::tjhis::this
    :C:thisis::this is
    ::thsoe::those
    ::htose::those
    :C:THose::Those
    ::thoes::those
    ::htoes::those
    ::thoguh::though
    :*:thoguht::thought             ; thought/s/ful/fully
    ::thrad::thread
    ::htread::thread
    ::thraed::thread
    ::therad::thread
    ::thrading::threading
    ::htreading::threading
    ::thraeding::threading
    ::therading::threading
    ::thrads::threads
    ::htreads::threads
    ::thraeds::threads
    ::therads::threads
    ::thershold::threshold
    ::throuhg::through
    ::thorugh::through
    ::thoruhg::through
    ::throuhgout::throughout
    ::thorughout::throughout
    ::throuhgput::throughput
    ::throughptu::throughput
    ::thoruhgput::throughput
    ::thorw::throw
    ::htrow::throw
    ::thorwn::thrown
    ::htrown::thrown
    ::thronw::thrown
    ::thorws::throws
    ::htrows::throws
    ::htus::thus
    :C:THus::Thus
    :C:thsu::thus
    :C:tiel::tile
    ::tield::tiled
    ::tiels::tiles
    ::tiemd::timed
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
    ::timesr::timers
    :*:tiemstamp::timestamp         ; timestamp/s/ed/ing
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
    ::t ogo::to go
    ::ot have::to have
    ::ot it::to it
    ::ot its::to its
    ::ot know::to know
    ::ot make::to make
    ::ot me::to me
    ::ot move::to move
    ::ot put::to put
    ::ot see::to see
    ::ot send::to send
    ::ot set::to set
    ::ot take::to take
    ::ot test::to test
    ::ot that::to that
    ::ot the::to the
    :*:ot hte::to the               ; needs '*' otherwise only 'hte' will be corrected
    :*:ot teh::to the
    ::tothe::to the
    ::t othe::to the
    ::ot them::to them
    ::ot these::to these
    ::ot this::to this
    ::ot those::to those
    ::ot try::to try
    ::ot use::to use
    ::ot what::to what
    ::ot where::to where
    ::ot which::to which
    ::ot work::to work
    ::ot you::to you
    ::to yuo::to you
    ::ot your::to your
    ::todya::today
    ::tdoay::today
    ::togehter::together
    ::toggel::toggle
    ::toggeld::toggled
    ::toggels::toggles
    :*:toekn::token                 ; token/s/ise/izer/isation
    :*:otekn::token
    ::tokne::token
    ::tokesn::tokens
    ::toknes::tokens
    :C:todl::told
    ::toelrance::tolerance
    ::toelrances::tolerances
    ::tomororw::tomorrow
    ::toolchian::toolchain
    ::toosl::tools
    ::toolsrip::toolstrip
    ::toplogical::topological
    ::topoloical::topological
    ::totla::total
    ::totlaed::totaled
    ::toatlly::totally
    ::totlas::totals
    ::touhc::touch
    ::tracigns::tracings
    ::trakc::track
    ::trian::train
    ::trianer::trainer
    ::trianing::training
    ::trians::trains
    :*:trnas::trans                 ; trans/fer/mit/port/lation/action
    ::transcation::transaction
    ::transcations::transactions
    :*:trasnfer::transfer           ; transfer/s/ed/ing/ral
    :*:transofrm::transform         ; transform/s/ed/ing/ation
    :*:transofmr::transform
    ::transfomer::transformer
    ::transformesr::transformers
    ::transitoined::transitioned
    ::transiitive::transitive
    ::transiitively::transitively
    :*:transalt::translat           ; translat/e/ed/es/ion
    :*:transoprt::transport         ; transport/s/ed/ing/ation
    ::travling::traveling
    ::traversla::traversal
    ::traverslas::traversals
    ::traversign::traversing
    ::treee::tree
    ::treees::trees
    ::triaeg::triage
    ::trikc::trick
    ::trikcs::tricks
    ::tries ot::tries to
    ::trie sto::tries to
    :*:tirgger::trigger             ; trigger/s/ed/ing
    :C:triger::trigger
    ::trigered::triggered
    ::triggerd::triggered
    ::trigering::triggering
    ::trigers::triggers
    :C:TRue::True
    :*:ture;::true;
    ::trucnate::truncate
    ::trucnated::truncated
    ::trucnates::truncates
    ::try ot::try to
    ::trying ot::trying to
    ::tuend::tuned
    ::tuens::tunes
    ::tupel::tuple
    ::tupels::tuples
    ::turend::turned
    ::tutorila::tutorial
    ::tutorilas::tutorials
    ::twithc::twitch
    ::tyep::type
    ::tyepalias::typealias          ; Swift keyword
    ::tyepd::typed
    ::tyepdef::typedef
    ::typenaem::typename            ; C++ keyword
    ::typenmae::typename
    ::tyepof::typeof
    ::tyeps::types
    ::typse::types
    ::tpyical::typical
    ::typcial::typical
    ::tpyically::typically
    ::typcially::typically

    ::unavialable::unavailable
    :*:unlbock::unblock             ; unblock/s/ed/ing
    ::unchagned::unchanged
    ::unclera::unclear
    ::unclaer::unclear
    ::undfeined::undefined
    ::undefiend::undefined
    :*:udner::under                 ; under/flow/neath/stand/whelm
    :*:understnad::understand       ; understand/s/ing/able
    ::underwheml::underwhelm
    ::undoign::undoing
    ::undonig::undoing
    ::unfinsihed::unfinished
    ::unhadnled::unhandled
    ::unhanlded::unhandled
    ::unhelathy::unhealthy
    ::unheatlhy::unhealthy
    ::unhealhty::unhealthy
    ::unehalthy::unhealthy
    ::uniofrmly::uniformly
    ::unimporant::unimportant
    :*:unintall::uninstall          ; uninstall/ed/er/ation
    :*:uninstsall::uninstall
    :*:unintsall::uninstall
    :*:uninstlal::uninstall
    ::unoin::union
    :*:uniqeu::unique               ; unique/ly
    :*:unqiue::unique
    :*:uniuqe::unique
    :*:uinque::unique
    :*:uqniue::unique
    :*:unqieu::unique
    :*:uqnieu::unique
    ::unti test::unit test
    ::unti tests::unit tests
    ::unittets::unittest            ; Python testing framework
    ::untitest::unittest
    ::unviersal::universal
    ::unkonwn::unknown
    ::unlikeyl::unlikely
    ::unlikn::unlink
    ::unorderd::unordered
    ::unordrerd::unordered
    ::unordred::unordered
    ::unpakc::unpack
    ::unraed::unread
    :*:unregistser::unregister      ; unregister/s/ed/ing
    :*:unreigster::unregister
    ::unrealted::unrelated
    ::unsaef::unsafe
    ::unsfae::unsafe
    ::unshfit::unshift
    ::unsgined::unsigned
    ::unsigend::unsigned
    ::unsgiend::unsigned
    :*:unsrot::unsort               ; unsort/ed/ing/able
    :*:unosrt::unsort
    :*:unsubcribe::unsubscribe      ; unsubscribe/d/s
    ::unitl::until
    ::utnil::until
    :*:udpate::update               ; update/d/r/s
    :*:upadte::update
    :*:updadte::update
    ::udpating::updating
    ::upadting::updating
    ::updateing::updating
    ::upgarde::upgrade
    :*:uploda::upload               ; upload/s/ed/er/ing
    ::upepr::upper
    ::upsream::upstream
    ::usgae::usage
    ::usaeg::usage
    ::uesd::used
    ::used ot::used to
    ::uesr::user
    ::uesrname::username
    ::uesrs::users
    ::usesr::users
    ::usign::using
    ::uszie::usize                  ; Rust data type
    ::usiez::usize
    ::utitlities::utilities
    ::utilites::utilities
    ::utilties::utilities
    ::utiltity::utility
    ::utitlity::utility

    ::vacnat::vacant
    ::valgridn::valgrind
    ::vlaid::valid
    ::avlid::valid
    ::vlaidate::validate
    ::avlidate::validate
    ::vlaidated::validated
    ::avlidated::validated
    ::validted::validated
    ::vlaidates::validates
    ::avlidates::validates
    ::avlidation::validation
    ::vlaidation::validation
    ::validadtor::validator
    ::vlaiditiy::validitiy
    ::avliditiy::validitiy
    ::valiidty::validity
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
    ::vareiables::variables
    ::varibales::variables
    ::varibles::variables
    ::varaibles::variables
    ::vairables::variables
    ::varaidic::variadic
    ::variatn::variant
    ::variatns::variants
    ::vautl::vault
    ::vecotr::vector
    ::vecctor::vector
    ::vctor::vector
    :C:vectro::vector
    ::vecotrs::vectors
    ::vecctors::vectors
    ::vctors::vectors
    ::verbsoe::verbose
    ::veirfication::verification
    ::vierfication::verification
    ::verificastion::verification
    ::veirfy::verify
    ::vierfy::verify
    ::verifiy::verify
    ::veriyf::verify
    ::veify::verify
    ::vieryf::verify
    ::veiryf::verify
    :*:vesrion::version             ; version/s/ing
    :*:veriosn::version
    :*:verisno::version
    :*:verison::version
    :*:vesrino::version
    ::vetex::vertex
    ::veritcal::vertical
    ::veritical::vertical
    ::vrey::very
    ::vidoe::video
    ::ivdeo::video
    ::vidoes::videos
    ::ivdeos::videos
    ::videso::videos
    ::veiw::view
    ::veiwed::viewed
    ::viewr::viewer
    ::veiwer::viewer
    ::veiwing::viewing
    ::veiwport::viewport
    ::veiws::views
    ::vitual::virtual
    :*:virutal::virtual             ; virtual/ise/ize/ization
    :*:virtula::virtual
    ::viisble::visible
    ::visibel::visible
    ::viisblity::visiblility
    :*:viist::visit                 ; visit/s/ed/or/ing/ors
    :*:vsiit::visit
    ::visisted::visited
    :*:viusal::visual               ; visual/s/ly/ise/ize/ized/ization
    :*:visula::visual
    :*:visaul::visual
    ::visualiation::visualization
    ::visualiations::visualizations
    ::vocie::voice
    ::vocied::voiced
    ::vocies::voices
    :C:vodi::void                   ; C data type
    :C:viod::void
    ::voluem::volume
    ::ovlume::volume
    ::voluems::volumes
    ::ovlumes::volumes

    :C:wiat::wait
    ::wiated::waited
    ::wiating::waiting
    ::wiats::waits
    ::wkae::wake
    ::wkaes::wakes
    ::walkthrouhg::walkthrough
    ::watn::want
    :C:wnat::want
    ::want ot::want to
    ::wnated::wanted
    ::watns::wants
    ::wnats::wants
    ::wanring::warning
    ::wraning::warning
    :C:wsa::was
    :C:WAs::Was
    ::wa snot::was not
    ::was nto::was not
    ::was ont::was not
    ::wans't::wasn't
    ::wan't::wasn't
    ::wasnt'::wasn't
    :*:wtach::watch                 ; watch/ed/es/dog/point
    :*:awtch::watch
    ::watchpiotn::watchpoint
    ::watchpiotns::watchpoints
    ::way ot::way to
    ::wa yto::way to
    ::wya to::way to
    :C:wyas::ways
    ::weakesn::weakens
    ::webpaeg::webpage
    :*:wieght::weight               ; weight/s/ed/ing
    ::wetn::went
    ::were nto::were not
    ::were ont::were not
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
    ::whe nit::when it
    :C:when ti::when it
    ::whent he::when the
    ::whe nthe::when the
    ::when ot::when to
    ::whenver::whenever
    ::wehnever::whenever
    ::hwenever::whenever
    :C:WHere::Where
    :C:Wheer::Where
    ::whree::where
    ::werhe::where
    ::wher eare::where are
    ::wher ethe::where the
    ::where ot::where to
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
    ::hiwch::which
    ::hiwhc::which
    ::whicht he::which the
    ::which ot::which to
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
    :*:whtie::white                 ; white/list/board/space/listed
    :*:hwite::white
    :*:wihte::white
    :*:whitelsit::whitelist         ; whitelist/s/ed/ing
    :C:WHo::Who
    ::whoaim::whoami
    ::whoel::whole
    ::hwose::whose
    ::whoes::whose
    :C:WHose::Whose
    :C:WHy::Why
    ::hwy are::why are
    ::hwy can::why can
    ::hwy do::why do
    ::hwy does::why does
    ::hwy has::why has
    ::hwy have::why have
    ::hwy is::why is
    ::hwy it::why it
    ::hwy not::why not
    ::why nto::why not
    ::why ont::why not
    ::hwy the::why the
    ::hwy they::why they
    ::hwy will::why will
    ::hwy would::why would
    ::hwy you::why you
    ::widlye::widely
    ::iwdth::width
    ::widht::width
    ::iwdths::widths
    ::widhts::widths
    ::iwll::will
    ::wil lbe::will be
    ::will nto::will not
    ::will ont::will not
    :*:winowd::window               ; window/s/ed/ing
    :*:winodw::window
    :*:iwndow::window
    ::windwo::window
    ::windwos::windows
    ::iwth::with
    :C:wiht::with
    ::wtih::with
    :C:WIth::With
    :C:iwht::with
    ::wit ha::with a
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
    :C:Wokr::Work
    :C:Wrok::Work
    ::workaorund::workaround
    ::owrkaround::workaround
    ::wokraround::workaround
    ::owrked::worked
    ::wokred::worked
    ::wroked::worked
    ::worekd::worked
    ::wroker::worker
    ::owrker::worker
    ::wokrer::worker
    ::workeres::workers
    ::wrokers::workers
    ::owrkers::workers
    ::wokrers::workers
    ::worklfow::workflow
    ::workflwo::workflow
    ::owrkflow::workflow
    ::wokrflow::workflow
    ::wrokflow::workflow
    ::workflwos::workflows
    ::worklfows::workflows
    ::wrokflows::workflows
    ::owrkflows::workflows
    ::wokrflows::workflows
    ::workigns::workings
    ::worknigs::workings
    ::wokrspace::workspace
    ::owrkspace::workspace
    ::wokrspaces::workspaces
    ::owrkspaces::workspaces
    :*:worht::worth                 ; worth/y/less/while
    ::woudl::would
    ::owuld::would
    ::would nto::would not
    ::would ont::would not
    ::wouldnt'::wouldn't
    ::woudln't::wouldn't
    ::woulnd't::wouldn't
    ::wrapepr::wrapper
    ::wirtable::writable
    :*:wirte::write                 ; write/r/s
    :*:wriet::write
    :*:wrtie::write
    ::wirting::writing
    ::wirtings::writings
    ::wirtten::written
    ::writen::written

    ::xpaht::xpath                  ; xml querying language

    ::yaer::year
    ::yaers::years
    ::yesterdya::yesterday
    :*:yeidl::yield                 ; yield/s/ed/ing
    :*:yeild::yield
    :C:YOu::You
    ::yo uare::you are
    ::yo ucan::you can
    ::yo ufor::you for
    ::yo uhave::you have
    ::yo uneed::you need
    ::yo uto::you to
    :C:you ot::you to
    ::yo uwill::you will
    ::yoru::your
    ::yuor::your
    ::yorus::yours
    ::yuors::yours
    ::yoruself::yourself
    ::youself::yourself
    ::yuorself::yourself

    :C:zeor::zero
    :C:zeors::zeros
    ::zoen::zone
    ::zoens::zones

    ; SUFFIX LIST
    ; Autocorrect words which have these endings.
    ; Useful suffix dictionary search tool: https://www.litscape.com/word_tools/ends_with.php

    :C?:albe::able        ; ex: available, mutable, enable, scalable, readable, variable, testable, table
    :C?:abel::able
    :C?:albes::ables
    :C?:abels::ables
    :C?:abyl::ably        ; ex: reliably, probably, arguably, durably, justifiably, notably
    :C?:aicng::acing      ; ex: spacing, tracing, replacing, placing, emplacing, interfacing
    :C?:akcs::acks        ; ex: tracks, packs, callbacks, hacks, hijacks, racks, stacks
    :C?:aegd::aged        ; ex: averaged, imaged, managed, packaged, triaged, paged, engaged
    :C?:aegs::ages        ; ex: languages, pages, messages, usages, outages, manages, averages
    :C?:gaes::ages
    :C?:ianed::ained      ; ex: contained, retained, trained, maintained, remained, chained, constrained
    :C?:aiend::ained
    :C?:aisn::ains        ; ex: remains, domains, trains, contains, chains, maintains
    :C?:laize::alize      ; ex: equalize, initialize, normalize, visualize, serialize, virtualize
    :C?:laized::alized
    :C?:laizes::alizes
    :C?:allly::ally       ; ex: automatically, finally, optionally, sporadically, computationally, dynamically
    :C?:alyl::ally
    :C?:laly::ally
    :C?:nace::ance        ; ex: balance, distance, finance, instance, tolerance, advance, enhance
    :C?:acne::ance
    :C?:acned::anced
    :C?:nacer::ancer
    :C?:acner::ancer
    :C?:naces::ances
    :C?:acnes::ances
    :C?:raes::ares        ; ex: shares, declares, prepares, compares, squares, spares
    :C?:airty::arity      ; ex: parity, modularity, similarity, linearity, popularity, granularity
    :C?:aesd::ased        ; ex: erased, based, increased, released, leased, aliased, chased
    :C?:athc::atch        ; ex: catch, batch, match, watch, dispatch, patch, latch
    :C?:aetd::ated        ; ex: emulated, obfuscated, encapsulated, updated, automated, related
    :C?:taed::ated
    :C?:aetly::ately      ; ex: accurately, moderately, approximately, immediately, ultimately, deliverately
    :C?:taely::ately
    :C?:taion::ation      ; ex: application, optimization, relation, mutation, replication, deviation
    :C?:taoin::ation
    :C?:aotin::ation
    :C?:itaon::ation
    :C?:taional::ational  ; ex: relational, educational, operational, rational, observational, computational
    :C?:taions::ations
    :C?:taoins::ations
    :C?:itaons::ations
    :C?:taive::ative      ; ex: native, collaborative, alternative, iterative, generative, declarative
    :C?:atiely::atively
    :C?:taively::atively
    :C?:aitvely::atively
    :C?:atro::ator        ; ex: generator, emulator, operator, iterator, numerator, authenticator, decorator
    :C?:aotr::ator
    :C?:atros::ators
    :C?:aotrs::ators

    :C?:bakc::back        ; ex: back, callback, playback, fallback, rollback, feedback, drawback
    :C?:besr::bers        ; ex: members, numbers, subscribers, remembers, fibers, probers
    :C?:bilties::bilities ; ex: abilities, probabilities, availabilities, possibilities, capabilities, responsibilities
    :C?:blities::bilities
    :C?:bilites::bilities
    :C?:blites::bilities
    :C?:biilties::bilities
    :C?:bilty::bility     ; ex: scalability, ability, mutability, probability, stability, visibility, availability
    :C?:blity::bility
    :C?:ilbity::bility
    :C?:biilty::bility
    :C?:bign::bing        ; ex: stubbing, climbing, combing, cubing, describing, plumbing, probing
    :C?:bnig::bing
    :C?:bgin::bing
    :C?:baord::board      ; ex: keyboard, clipboard, dashboard, motherboard, soundboard, leaderboard, onboard
    :C?:borad::board
    :C?:boadr::board
    :C?:baording::boarding
    :C?:borading::boarding
    :C?:boadring::boarding
    :C?:baords::boards
    :C?:borads::boards
    :C?:byet::byte        ; ex: kilobyte, megabyte, gigabyte, terabyte, petabyte, exabyte
    :C?:byets::bytes

    :C?:csat::cast        ; ex: cast, upcast, downcast, broadcast, anycast, multicast
    :C?:csated::casted
    :C?:csating::casting
    :C?:csats::casts
    :C?:caet::cate        ; ex: allocate, duplicate, authenticate, communicate, truncate, replicate
    :C?:caets::cates
    :C?:ctaing::cating    ; ex: locating, replicating, preallocating, obfuscating, communicating, authenticating
    :C?:caction::cation   ; ex: notification, replication, allocation, application, communication, authentication
    :C?:caion::cation
    :C?:catsion::cation
    :C?:cactions::cations
    :C?:caions::cations
    :C?:catsions::cations
    :C?:cesr::cers        ; ex: producers, sequencers, replacers, reducers, servicers, tracers
    :C?:hcable::chable    ; ex: searchable, reachable, attachable, touchable, catchable, watchable
    :C?:hced::ched        ; ex: cached, fetched, glitched, batched, searched, launched
    :C?:hcer::cher        ; ex: cacher, fetcher, batcher, searcher, launcher, dispatcher
    :C?:hcers::chers
    :C?:hces::ches        ; ex: catches, touches, switches, matches, glitches, dispatches, attaches
    :C?:hcing::ching      ; ex: caching, matching, touching, watching, launching, patching
    :C?:hicng::ching
    :C?:cign::cing        ; ex: advancing, announcing, reducing, splicing, tracing, coercing
    :C?:cnig::cing
    :C?:cgin::cing
    :C?:ctiy::city        ; ex: capacity, opacity, scarcity, atomicity, multiplicity, authenticity
    :C?:ciyt::city
    :C?:citiy::city
    :C?:kcable::ckable    ; ex: lockable, checkable, clickable, blockable, mockable, trackable
    :C?:kced::cked        ; ex: locked, unlocked, picked, stacked, checked, clicked, tracked
    :C?:kcer::cker        ; ex: locker, unlocker, picker, docker, checker, clicker, tracker
    :C?:cekr::cker
    :C?:kcers::ckers
    :C?:cekrs::ckers
    :C?:kcet::cket        ; ex: ticket, packet, socket, bracket, racket, bucket
    :C?:ckte::cket
    :C?:kcets::ckets
    :C?:cktes::ckets
    :C?:kcing::cking      ; ex: locking, tracking, mocking, blocking, checking, stacking
    :C?:tcion::ction      ; ex: function, introduction, connection, reduction, section, action, injection
    :C?:tcions::ctions
    :C?:clty::ctly        ; ex: abstractly, correctly, distinctly, perfectly, directly, strictly
    :C?:tcor::ctor        ; ex: vector, collector, constructor, factor, detector, extractor, predictor
    :C?:tcors::ctors

    :C?:DAta::Data        ; ex: Data, newData, myData, oldData, prevData, currentData
    :C?:daet::date        ; ex: update, validate, invalidate, mandate, candidate, predate, accommodate
    :C?:dtae::date
    :C?:daets::dates
    :C?:dtaes::dates
    :C?:dadtion::dation   ; ex: validation, degradation, recommendation, foundation, invalidation, consolidation
    :C?:denet::dent       ; ex: independent, descendent, dependent, indent, resident, incident
    :C?:detn::dent
    :C?:denets::dents
    :C?:desr::ders        ; ex: encoders, transponders, leaders, providers, readers, senders, folders
    :C?:idng::ding        ; ex: loading, finding, padding, coding, encoding, building, ascending
    :C?:indg::ding
    :C?:dign::ding
    :C?:dnig::ding
    :C?:idngs::dings
    :C?:indgs::dings
    :C?:digns::dings
    :C?:dnigs::dings
    :C?:donw::down        ; ex: down, markdown, shutdown, slowdown, teardown, dropdown, lockdown
    :C?:odwn::down
    :C?:donws::downs
    :C?:odwns::downs

    :C?:leing::eling      ; ex: traveling, leveling, labeling, canceling, modeling, tunneling
    :C?:ecne::ence        ; ex: experience, sequence, fence, intelligence, reference, recurrence, resilience
    :C?:ecnes::ences
    :C?:necy::ency        ; ex: adjacency, consistency, frequency, dependency, latency, efficiency, transparency
    :C?:enyc::ency
    :C?:ecny::ency
    :C?:edns::ends        ; ex: appends, extends, intends, suspends, depends, trends
    :C?:eend::ened        ; ex: opened, flattened, listened, reopened, hardened, happened, evened
    :C?:netion::ention    ; ex: attention, convention, contention, intention, mention, retention
    :C?:netions::entions
    :C?:etns::ents        ; ex: represents, clients, comments, indents, elements, implements
    :C?:oeus::eous        ; ex: simultaneous, miscellaneous, advantageous, erroneous, homogeneous, extraneous
    :C?:oeusly::eously
    :C?:erla::eral        ; ex: general, literal, peripheral, ephemeral, several, numeral
    :C?:erlas::erals

    :C?:ofrm::form        ; ex: platform, perform, transform, inform, uniform, conform
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
    :C?:yfing::fying      ; ex: verifying, clarifying, simplifying, qualifying, classifying, minifying

    :C?:gaion::gation     ; ex: aggregation, propagation, investigation, mitigation, negation, delegation
    :C?:gaions::gations
    :C?:getn::gent        ; ex: agent, intelligent, tangent, convergent, divergent, urgent
    :C?:getnly::gently
    :C?:gign::ging        ; ex: changing, debugging, logging, messaging, merging, challenging
    :C?:gnig::ging
    :C?:garphy::graphy    ; ex: cryptography, photography, demography, typography, steganography, topography
    :C?:grahpy::graphy

    :C?:hign::hing        ; ex: caching, hashing, batching, patching, branching, switching, thing
    :C?:hnig::hing
    :C?:hgin::hing

    :C?:aible::iable      ; ex: variable, reliable, satisfiable, specifiable, viable, modifiable
    :C?:ialy::ially       ; ex: sequentially, essentially, artificially, exponentially, partially, officially
    :C?:inat::iant        ; ex: variant, invariant, compliant, reliant, covariant, giant
    :C?:ilbe::ible        ; ex: compatible, accessible, extensible, reproducible, visible, convertible
    :C?:icla::ical        ; ex: topological, canonical, symmetrical, logical, lexical, technical
    :C?:iaction::ication  ; ex: notification, replication, application, communication, classification, verification
    :C?:iicent::icient    ; ex: efficient, deficient, coefficient, inefficient, sufficient, proficient
    :C?:iicently::iciently
    :C?:eince::ience      ; ex: experience, science, patience, convenience, audience, resilience
    :C?:einces::iences
    :C?:ietn::ient        ; ex: gradient, quotient, client, transient, recipient, efficient, resilient
    :C?:ienet::ient
    :C?:eint::ient
    :C?:eitn::ient
    :C?:eintly::iently    ; ex: efficiently, conveniently, inefficiently, sufficiently, resiliently, proficiently
    :C?:ietnly::iently
    :C?:ienets::ients
    :C?:eints::ients
    :C?:eitns::ients
    :C?:iifed::ified      ; ex: specified, classified, simplified, verified, unified, identified
    :C?:iified::ified
    :C?:ifeid::ified
    :C?:iifer::ifier      ; ex: specifier, classifier, simplifier, verifier, unifier, identifier
    :C?:iifier::ifier
    :C?:iifers::ifiers
    :C?:iifiers::ifiers
    :C?:iifes::ifies      ; ex: specifies, verifies, notifies, amplifies, identifies, justifies, magnifies
    :C?:iifies::ifies
    :C?:fiies::ifies
    :C?:igth::ight        ; ex: height, weight, right, light, sight, eight, copyright
    :C?:ihgt::ight
    :C?:igths::ights
    :C?:ihgts::ights
    :C?:liity::ility      ; ex: probability, stability, feasibility, capability, utility, availability
    :C?:ienr::iner        ; ex: container, definer, combiner, chainer, joiner, refiner
    :C?:einr::iner
    :C?:ienrs::iners
    :C?:einrs::iners
    :C?:niing::ining      ; ex: training, determining, defining, explaining, examining, combining
    :C?:oinal::ional      ; ex: conditional, optional, functional, rational, relational, computational
    :C?:ioanl::ional
    :C?:oinally::ionally
    :C?:oinals::ionals
    :C?:ioanls::ionals
    :C?:iosn::ions        ; ex: expressions, options, functions, operations, conditions, directions
    :C?:ouis::ious        ; ex: previous, various, dubious, suspicious, cautious, malicious
    :C?:oius::ious
    :C?:iosu::ious
    :C?:ouisly::iously    ; ex: previously, spuriously, obliviously, suspiciously, ambitiously, maliciously
    :C?:oiusly::iously
    :C?:iosuly::iously
    :C?:riing::iring      ; ex: hiring, acquiring, impairing, requiring, retiring, pairing
    :C?:iesd::ised        ; ex: equalised, synchronised, amortised, randomised, memorised, serialised
    :C?:iesr::iser        ; ex: equaliser, synchroniser, amortiser, randomiser, memoriser, serialiser
    :C?:iison::ision      ; ex: decision, collision, revision, division, elision, vision
    :C?:iisons::isions
    :C?:iites::ities      ; ex: capabilities, quantities, capacities, probabilities, equalities, utilities
    :C?:tiies::ities
    :C?:tiing::iting      ; ex: waiting, writing, editing, limiting, visiting, inheriting
    :C?:tiign::iting
    :C?:tiion::ition      ; ex: partition, definition, condition, precondition, position, transition
    :C?:tiioned::itioned
    :C?:tiioning::itioning
    :C?:tiions::itions
    :C?:tiive::itive      ; ex: positive, primitive, repetitive, transitive, additive, sensitive
    :C?:tiively::itively
    :C?:tiives::itives
    :C?:ivley::ively      ; ex: relatively, actively, iteratively, recursively, productively, effectively
    :C?:iezd::ized        ; ex: equalized, synchronized, amortized, randomized, memorized, serialized

    :C?:kign::king        ; ex: working, networking, multitasking, benchmarking, mocking, chunking, masking
    :C?:knig::king
    :C?:kgin::king

    :C?:alble::lable      ; ex: available, unavailable, callable, scalable, recyclable, calculable
    :C?:laet::late        ; ex: template, simulate, emulate, populate, extrapolate, translate
    :C?:laets::lates
    :C?:alyed::layed      ; ex: delayed, displayed, played, replayed, overlayed, relayed
    :C?:lnie::line        ; ex: online, offline, baseline, pipeline, timeline, newline, decline
    :C?:lnied::lined
    :C?:lnies::lines
    :C?:lign::ling        ; ex: profiling, sampling, throttling, scaling, filling, railing, polling, emailing
    :C?:lnig::ling
    :C?:lgin::ling
    :C?:ilng::ling
    :C?:ligns::lings
    :C?:lnigs::lings
    :C?:lgins::lings
    :C?:ilngs::lings
    :C?:ltiy::lity        ; ex: probability, stability, quality, capability, utility, functionality
    :C?:liyt::lity
    :C?:litiy::lity
    :C?:lzie::lize        ; ex: initialize, serialize, visualize, normalize, utilize, virtualize
    :C?:liez::lize
    :C?:lzied::lized
    :C?:lzier::lizer
    :C?:leld::lled        ; ex: called, installed, controlled, polled, filled, killed
    :C?:lelr::ller        ; ex: caller, smaller, controller, teller, installer, poller, seller
    :C?:laod::load        ; ex: load, overload, download, upload, workload, offload, bootload, payload
    :C?:laoded::loaded
    :C?:laoder::loader
    :C?:laoding::loading
    :C?:laods::loads
    :C?:lcok::lock        ; ex: lock, block, clock, spinlock, overclock, deadlock, unlock
    :C?:lokc::lock
    :C?:lcoked::locked
    :C?:lcoks::locks
    :C?:loyg::logy        ; ex: technology, terminology, methodology, cryptology, topology, lexicology

    :C?:amrk::mark        ; ex: mark, benchmark, bookmark, checkmark, trademark, remark
    :C?:mrak::mark
    :C?:amrked::marked
    :C?:mraked::marked
    :C?:amrking::marking
    :C?:mraking::marking
    :C?:amrks::marks
    :C?:mraks::marks
    :C?:amte::mate        ; ex: approximate, estimate, animate, automate, summate, legitimate
    :C?:amted::mated
    :C?:amtes::mates
    :C?:maion::mation     ; ex: information, summation, automation, estimation, animation, approximation
    :C?:maions::mations
    :C?:menet::ment       ; ex: comment, argument, increment, element, environment, implement, experiment
    :C?:emnt::ment
    :C?:emtn::ment
    :C?:metn::ment
    :C?:mnet::ment
    :C?:meent::ment
    :C?:emntal::mental
    :C?:emtnal::mental
    :C?:metnal::mental
    :C?:mnetal::mental
    :C?:meented::mented
    :C?:meneted::mented
    :C?:mneted::mented
    :C?:emnted::mented
    :C?:meneting::menting
    :C?:emnting::menting
    :C?:mneting::menting
    :C?:meenting::menting
    :C?:emnts::ments
    :C?:emtns::ments
    :C?:menets::ments
    :C?:meents::ments
    :C?:mnets::ments
    :C?:mign::ming        ; ex: programming, trimming, framing, zooming, transforming, timing, naming
    :C?:mnig::ming
    :C?:mgin::ming
    :C?:migns::mings
    :C?:mnigs::mings
    :C?:mgins::mings
    :C?:msie::mise        ; ex: customise, minimise, maximise, optimise, randomise, systemise
    :C?:msied::mised
    :C?:msier::miser
    :C?:msies::mises
    :C?:mzie::mize
    :C?:mzied::mized
    :C?:mzier::mizer
    :C?:mzies::mizes

    :C?:anlly::nally      ; ex: finally, conditionally, functionally, optionally, marginally, internally
    :C?:ntae::nate        ; ex: concatenate, eliminate, alternate, coordinate, terminate, designate
    :C?:naet::nate
    :C?:ntaes::nates
    :C?:naets::nates
    :C?:naion::nation     ; ex: combination, coordination, alternation, concatenation, designation, destination
    :C?:naions::nations
    :C?:nices::ncies      ; ex: dependencies, frequencies, agencies, currencies, latencies, emergencies
    :C?:nicng::ncing      ; ex: advancing, balancing, referencing, syncing, sequencing, influencing
    :C?:dned::nded        ; ex: appended, expanded, suspended, rounded, extended, responded
    :C?:dner::nder        ; ex: render, responder, under, extender, remainder, finder, sender
    :C?:dners::nders
    :C?:dning::nding      ; ex: rounding, appending, binding, finding, sending, extending, responding
    :C?:nign::ning        ; ex: beginning, chaining, containing, designing, functioning, opening
    :C?:nnig::ning
    :C?:nigns::nings
    :C?:nnigs::nings
    :C?:ngins::nings
    :C?:ntiy::nity        ; ex: infinity, opportunity, sanity, vicinity, unity, affinity
    :C?:kning::nking      ; ex: linking, ranking, thinking, chunking, shrinking, blinking
    :C?:NOde::Node        ; ex: Node, TreeNode, ListNode, CurrentNode, GraphNode, TrieNode
    :C?:Ndoe::Node
    :C?:snive::nsive      ; ex: responsive, expensive, defensive, offensive, expansive, extensive
    :C?:tnation::ntation  ; ex: representation, orientation, segmentation, documentation, implementation, indentation
    :C?:tnations::ntations
    :C?:tned::nted        ; ex: counted, discounted, mounted, segmented, augmented, painted
    :C?:tning::nting      ; ex: documenting, implementing, printing, mounting, incrementing, wanting, granting

    :C?:okcs::ocks        ; ex: locks, unlocks, clocks, blocks, unblocks, mocks
    :C?:oitn::oint        ; ex: powerpoint, breakpoint, disjoint, watchpoint, checkpoint, midpoint
    :C?:iont::oint
    :C?:onit::oint
    :C?:oitns::oints
    :C?:ionts::oints
    :C?:onits::oints
    :C?:oend::oned        ; ex: cloned, conditioned, partitioned, functioned, versioned, provisioned, mentioned
    :C?:noed::oned
    :C?:eond::oned
    :C?:roed::ored        ; ex: monitored, stored, factored, explored, refactored, restored
    :C?:oreis::ories      ; ex: repositories, accessories, factories, histories, theories, directories, inventories
    :C?:roies::ories
    :C?:soed::osed        ; ex: closed, composed, enclosed, exposed, posed, supposed, disposed
    :C?:oudn::ound        ; ex: background, foreground, compound, sound, round, workaround
    :C?:uond::ound
    :C?:oudns::ounds
    :C?:uonds::ounds
    :C?:outn::ount        ; ex: count, account, amount, discount, mount, popcount
    :C?:outns::ounts
    :C?:ousyl::ously      ; ex: previously, simultaneously, extraneously, continuously, synchronously, dangerously
    :C?:woed::owed        ; ex: flowed, borrowed, allowed, windowed, shadowed, slowed, followed, showed
    :C?:oewr::ower        ; ex: follower, power, slower, lower, thrower, borrower
    :C?:oewrs::owers

    :C?:petc::pect        ; ex: aspect, expect, inspect, introspect, prospect, respect, suspect
    :C?:eprs::pers        ; ex: developers, wrappers, scrapers, keepers, mappers, helpers, skippers
    :C?:pign::ping        ; ex: mapping, scraping, stepping, skipping, wrapping, looping
    :C?:pnig::ping
    :C?:pgin::ping
    :C?:pigns::pings
    :C?:pnigs::pings
    :C?:pgins::pings
    :C?:opint::point      ; ex: breakpoint, powerpoint, checkpoint, midpoint, logpoint, watchpoint
    :C?:opitn::point
    :C?:opints::points
    :C?:opitns::points
    :C?:prot::port        ; ex: import, export, support, transport, report, viewport, backport
    :C?:proted::ported
    :C?:proter::porter
    :C?:proters::porters
    :C?:proting::porting
    :C?:prots::ports
    :C?:opse::pose        ; ex: compose, expose, purpose, repurpose, transpose, dispose
    :C?:opsed::posed
    :C?:opses::poses
    :C?:psoes::poses
    :C?:tped::pted        ; ex: accepted, adapted, scripted, encrypted, decrypted, interrupted
    :C?:tpion::ption      ; ex: exception, adoption, caption, option, assumption, reception
    :C?:tpions::ptions
    :C?:tpive::ptive      ; ex: adaptive, descriptive, receptive, disruptive, perceptive, preemptive

    :C?:raeg::rage        ; ex: coverage, average, storage, leverage, overage, encourage
    :C?:rgae::rage
    :C?:rnat::rant        ; ex: grant, entrant, reentrant, quadrant, tolerant, registrant, errant
    :C?:ratn::rant
    :C?:rnats::rants
    :C?:ratns::rants
    :C?:raet::rate        ; ex: enumerate, migrate, integrate, generate, iterate, accurate
    :C?:raets::rates
    :C?:retn::rent        ; ex: apparent, different, parent, inherent, current, concurrent, coherent
    :C?:renet::rent
    :C?:retnly::rently
    :C?:renetly::rently
    :C?:irng::ring        ; ex: refactoring, string, rendering, engineering, monitoring, filtering
    :C?:rign::ring
    :C?:rnig::ring
    :C?:irngs::rings
    :C?:rigns::rings
    :C?:rnigs::rings
    :C?:rtiy::rity        ; ex: security, priority, parity, integrity, modularity, similarity
    :C?:ritiy::rity
    :C?:riyt::rity
    :C?:remd::rmed        ; ex: performed, alarmed, confirmed, transformed, formed, informed
    :C?:retd::rted        ; ex: sorted, supported, alerted, asserted, exported, inserted, started

    :C?:sehd::shed        ; ex: pushed, published, finished, established, stashed, hashed, flushed
    :C?:shesd::shed
    :C?:hsed::shed
    :C?:hses::shes        ; ex: hashes, accomplishes, pushes, finishes, vanishes, stashes
    :C?:hsing::shing      ; ex: refreshing, publishing, hashing, smashing, flushing, crashing
    :C?:sihp::ship        ; ex: relationship, ownership, spaceship, membership, leadership, partnership
    :C?:shpi::ship
    :C?:hsip::ship
    :C?:hspi::ship
    :C?:sihps::ships
    :C?:shpis::ships
    :C?:hsips::ships
    :C?:hspis::ships
    :C?:isde::side        ; ex: inside, outside, aside, beside, reside, upside, lookaside
    :C?:isdes::sides
    :C?:insg::sing        ; ex: using, parsing, processing, addressing, missing, raising, expressing
    :C?:snig::sing
    :C?:isng::sing
    :C?:sino::sion        ; ex: expression, recursion, comprehension, version, permission, dimension
    :C?:soin::sion
    :C?:oisn::sion
    :C?:soins::sions
    :C?:sinos::sions
    :C?:oisns::sions
    :C?:stiy::sity        ; ex: sparsity, necessity, diversity, intensity, falsity, verbosity
    :C?:svie::sive        ; ex: recursive, expressive, permissive, inclusive, successive, exclusive
    :C?:sviely::sively
    :C?:srot::sort        ; ex: sort, mergesort, quicksort, heapsort, timsort, introsort
    :C?:osrt::sort
    :C?:sapce::space      ; ex: workspace, backspace, namespace, subspace, cyberspace, whitespace
    :C?:spcae::space
    :C?:psace::space
    :C?:sapces::spaces
    :C?:spcaes::spaces
    :C?:psaces::spaces
    :C?:issng::ssing      ; ex: missing, processing, multiprocessing, assessing, addressing, bypassing
    :C?:sntat::stant      ; ex: constant, assistant, resistant, instant, distant, contestant
    :C?:sntats::stants
    :C?:tsed::sted        ; ex: nested, tested, rested, interested, posted, invested, listed, pasted
    :C?:setd::sted
    :C?:tsic::stic        ; ex: heuristic, statistic, deterministic, stochastic, logistic, elastic
    :C?:sitc::stic
    :C?:tsical::stical
    :C?:sitcal::stical
    :C?:tsics::stics
    :C?:sitcs::stics
    :C?:stisc::stics
    :C?:tsing::sting      ; ex: testing, nesting, hosting, persisting, broadcasting, posting, requesting, adjusting
    :C?:tsration::stration ; ex: orchestration, administration, demonstration, registration, illustration, preregistration
    :C?:tsrations::strations
    :C?:STring::String    ; ex: String, myString, firstString, oldString, newString, initialString
    :C?:srue::sure        ; ex: measure, closure, ensure, erasure, exposure, assure, sure
    :C?:usre::sure
    :C?:srues::sures
    :C?:usres::sures

    :C?:tbale::table      ; ex: table, executable, mutable, computable, selectable, portable
    :C?:taeg::tage        ; ex: advantage, shortage, outage, stage, percentage, vantage
    :C?:tnat::tant        ; ex: constant, important, instant, distant, inhabitant, assistant, extant
    :C?:tatn::tant
    :C?:tnatly::tantly
    :C?:tatnly::tantly
    :C?:tnats::tants
    :C?:tatns::tants
    :C?:tayr::tary        ; ex: proprietary, commentary, complementary, documentary, elementary, momentary
    :C?:tenet::tent       ; ex: persistent, content, existent, latent, consistent, extent, competent
    :C?:tenetly::tently
    :C?:tesr::ters        ; ex: pointers, characters, routers, counters, computers, clusters
    :C?:tehr::ther        ; ex: another, either, other, together, gather, farther
    :C?:tihng::thing      ; ex: thing, something, anything, nothing, everything, smoothing
    :C?:thying::thing
    :C?:itfy::tify        ; ex: identify, justify, notify, certify, quantify, rectify
    :C?:ityf::tify
    :C?:tiyf::tify
    :C?:itme::time        ; ex: lifetime, realtime, uptime, downtime, runtime, anytime
    :C?:tiem::time
    :C?:imte::time
    :C?:itmes::times
    :C?:tiems::times
    :C?:imtes::times
    :C?:itng::ting        ; ex: selecting, testing, printing, routing, collecting, computing, sorting
    :C?:tign::ting
    :C?:tnig::ting
    :C?:tgin::ting
    :C?:iton::tion        ; ex: function, exception, condition, transaction, authentication, representation
    :C?:tino::tion
    :C?:toin::tion
    :C?:iotn::tion
    :C?:itno::tion
    :C?:itonal::tional    ; ex: optional, functional, positional, conditional, operational, directional
    :C?:itnoal::tional
    :C?:tinoal::tional
    :C?:itonally::tionally
    :C?:itnoally::tionally
    :C?:tinoally::tionally
    :C?:itons::tions
    :C?:tinos::tions
    :C?:toins::tions
    :C?:iotns::tions
    :C?:itnos::tions
    :C?:otins::tions
    :C?:tvie::tive        ; ex: objective, active, relative, effective, primitive, alternative
    :C?:tviely::tively
    :C?:tvies::tives
    :C?:otry::tory        ; ex: directory, factory, history, inventory, repository, mandatory
    :C?:otyr::tory
    :C?:tetd::tted        ; ex: permitted, allotted, plotted, submitted, formatted, emitted
    :C?:tetr::tter        ; ex: formatter, letter, setter, plotter, submitter, transmitter, committer
    :C?:tetrs::tters
    :C?:taul::tual        ; ex: virtual, textual, actual, eventual, conceptual, mutual
    :C?:taully::tually
    :C?:tuer::ture        ; ex: feature, picture, future, structure, capture, mature
    :C?:utre::ture
    :C?:utred::tured
    :C?:tuers::tures
    :C?:utres::tures

    :C?:ualr::ular        ; ex: modular, regular, tabular, granular, singular, angular
    :C?:luar::ular
    :C?:ullly::ully       ; ex: successfully, carefully, restfully, watchfully, skillfully, gracefully
    :C?:ulyl::ully
    :C?:utls::ults        ; ex: results, testResults, defaults, faults, segfaults, consults
    :C?:rued::ured        ; ex: captured, structured, featured, measured, configured, secured, ensured
    :C?:uerd::ured
    :C?:tued::uted        ; ex: executed, permuted, contributed, distributed, computed, routed
    :C?:tuing::uting      ; ex: computing, executing, routing, rerouting, attributing, contributing
    :C?:tuion::ution      ; ex: execution, resolution, solution, distribution, contribution, caution
    :C?:tuions::utions

    :C?:Vlaue::Value      ; ex: Value, myValue, keyValue, maxValue, firstValue, initialValue
    :C?:Vluae::Value
    :C?:Valeu::Value
    :C?:Vaule::Value
    :C?:Vlaues::Values
    :C?:Vluaes::Values
    :C?:Valeus::Values
    :C?:Vaules::Values
    :C?:avte::vate        ; ex: activate, private, deactivate, derivate, motivate, innovate
    :C?:vaet::vate
    :C?:avted::vated
    :C?:avtes::vates
    :C?:vaets::vates
    :C?:vesr::vers        ; ex: servers, drivers, receivers, observers, solvers, delivers
    :C?:veyr::very        ; ex: very, every, delivery, discovery, rediscovery, recovery
    :C?:verey::very
    :C?:vign::ving        ; ex: having, archiving, retrieving, solving, resolving, proving, interleaving
    :C?:vnig::ving
    :C?:vgin::ving
    :C?:vtiy::vity        ; ex: activity, inactivity, connectivity, sensitivity, productivity, relativity, longevity
    :C?:ivty::vity
    :C?:viyt::vity

    :C?:wrad::ward        ; ex: award, backward, forward, reward, straightforward, toward, awkward
    :C?:wraded::warded
    :C?:wrads::wards
    :C?:wrae::ware        ; ex: software, hardware, shareware, firmware, courseware, aware
    :C?:awre::ware
    :C?:waer::ware
    :C?:wesr::wers        ; ex: answers, followers, borrowers, viewers, powers, lowers
    :C?:hwere::where      ; ex: where, nowhere, somewhere, everywhere, anywhere, elsewhere
    :C?:wehre::where
    :C?:wheer::where
    :C?:iwng::wing        ; ex: viewing, reviewing, flowing, drawing, growing, following, knowing
    :C?:wign::wing
    :C?:wnig::wing
    :C?:wgin::wing
    :C?:iwngs::wings
    :C?:wigns::wings
    :C?:wnigs::wings
    :C?:wgins::wings
    :C?:owrk::work        ; ex: work, network, framework, rework, groundwork, patchwork, guesswork
    :C?:wokr::work
    :C?:wrok::work
    :C?:owrking::working
    :C?:wokring::working
    :C?:wroking::working
    :C?:owrks::works
    :C?:wokrs::works
    :C?:wroks::works

    :C?:xign::xing        ; ex: fixing, indexing, sandboxing, prefixing, maxing, mixing, multiplexing
    :C?:xnig::xing
    :C?:xgin::xing

    :C?:yign::ying        ; ex: copying, querying, applying, modifying, displaying, relaying, playing
    :C?:ynig::ying
    :C?:ygin::ying

    :C?:zign::zing        ; ex: optimizing, minimizing, maximizing, serializing, visualizing, randomizing
    :C?:znig::zing
    :C?:zgin::zing
#HotIf
