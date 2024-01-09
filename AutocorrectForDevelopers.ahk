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
; Add '<', '>', and '*' to supported ending characters
;   - '<' and '>' are useful for C++ templates
;   - '*' is useful for pointers
; Note: all other EndChars characters below are default AHK end characters:
#Hotstring EndChars -()[]{}:;'"/\,.?!`n `t<>*

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
        ; waites = surname
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

    ; -dnet word suffix whitelist (do not convert these to -dent)
    :b0:dnet::
    :b0:wordnet::
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

    ; -ign word suffix whitelist (do not convert these to -ing)
    :b0:ign::
    :b0:align::
    :b0:arraign::
    :?b0:assign::               ; '?' breaks correcting of passign/surpassign/etc but at the benefit
                                ; of permitting 'assign' to be used a suffix such as 'varToAssign'
    :b0:benign::
    :b0:beign::                 ; not a word, but ambiguous between 'begin', 'being', and 'benign'
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

    ; -nices word suffix whitelist (do not convert these to -ncies)
    :b0:nices::
    :b0:cornices::
    {
    }

    ; -ntae word suffix whitelist (do not convert these to -nate)
    :b0:ntae::
    :b0:placentae::
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

    ; -tino word suffix whitelist (do not convert these to -tion)
    :b0:tino::
    :b0:latino::
    {
    }

    ; -tinos word suffix whitelist (do not convert these to -tions)
    :b0:tinos::
    :b0:latinos::
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

    ; whitelist suffixes (only autocorrect these when they appear as suffixes, see bottom of script)
    :b0:aegd::         ; do not convert this string to -aged
    :b0:aenous::       ; do not convert this string to -aneous
    :b0:aesd::         ; do not convert this string to -ased
    :b0:aesr::         ; do not convert this string to -aser
    :b0:aesrs::        ; do not convert this string to -asers
    :b0:aetd::         ; do not convert this string to -ated
    :b0:awre::         ; do not convert this string to -ware
    :b0:alble::        ; do not convert this string to -lable
    :b0:aiend::        ; do not convert this string to -ained
    :b0:airty::        ; do not convert this string to -arity
    :b0:aisn::         ; do not convert this string to -ains
    :b0:athc::         ; do not convert this string to -atch
    :b0:athces::       ; do not convert this string to -atches
    :b0:avte::         ; do not convert this string to -vate
    :b0:avted::        ; do not convert this string to -vated
    :b0:avtes::        ; do not convert this string to -vates
    :b0:bilties::      ; do not convert this string to -bilities
    :b0:bilites::      ; do not convert this string to -bilities
    :b0:bilty::        ; do not convert this string to -bility
    :b0:blites::       ; do not convert this string to -bilities
    :b0:blities::      ; do not convert this string to -bilities
    :b0:blity::        ; do not convert this string to -bility
    :b0:borad::        ; do not convert this string to -board
    :b0:caction::      ; do not convert this string to -cation
    :b0:cactions::     ; do not convert this string to -cations
    :b0:caet::         ; do not convert this string to -cate
    :b0:caets::        ; do not convert this string to -cates
    :b0:caion::        ; do not convert this string to -cation
    :b0:caions::       ; do not convert this string to -cations
    :b0:daet::         ; do not convert this string to -date
    :b0:denet::        ; do not convert this string to -dent
    :b0:dned::         ; do not convert this string to -nded
    :b0:eintly::       ; do not convert this string to -iently
    :b0:eitn::         ; do not convert this string to -ient
    :b0:eitns::        ; do not convert this string to -ients
    :b0:emnt::         ; do not convert this string to -ment
    :b0:emnts::        ; do not convert this string to -ments
    :b0:enyc::         ; do not convert this string to -ency
    :b0:erla::         ; do not convert this string to -eral
    :b0:erlas::        ; do not convert this string to -erals
    :b0:fomr::         ; do not convert this string to -form
    :b0:gaes::         ; do not convert this string to -ages
    :b0:gaion::        ; do not convert this string to -gation
    :b0:gaions::       ; do not convert this string to -gations
    :b0:garphy::       ; do not convert this string to -graphy
    :b0:getn::         ; do not convert this string to -gen

    :b0:hced::         ; do not convert this string to -ched
    :b0:hcer::         ; do not convert this string to -cher
    :b0:hcers::        ; do not convert this string to -chers
    :b0:hcing::        ; do not convert this string to -ching
    :b0:hicng::        ; do not convert this string to -ching
    :b0:hsing::        ; do not convert this string to -shing
    :b0:ianl::         ; do not convert this string to -inal
    :b0:iarty::        ; do not convert this string to -arity
    :b0:icla::         ; do not convert this string to -ical
    :b0:idng::         ; do not convert this string to -ding
    :b0:idngs::        ; do not convert this string to -dings
    :b0:idtion::       ; do not convert this string to -dition
    :b0:idtions::      ; do not convert this string to -ditions
    :b0:ienet::        ; do not convert this string to -ient
    :b0:ienetly::      ; do not convert this string to -iently
    :b0:ienets::       ; do not convert this string to -ients
    :b0:ietn::         ; do not convert this string to -ient
    :b0:ietnly::       ; do not convert this string to -iently
    :b0:ietns::        ; do not convert this string to -ients
    :b0:iezd::         ; do not convert this string to -ized
    :b0:iezr::         ; do not convert this string to -izer
    :b0:iezrs::        ; do not convert this string to -izers
    :b0:igth::         ; do not convert this string to -ight
    :b0:igths::        ; do not convert this string to -ights
    :b0:iicent::       ; do not convert this string to -icient
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
    :b0:ioanl::        ; do not convert this string to -ional
    :b0:iont::         ; do not convert this string to -oint
    :b0:ionts::        ; do not convert this string to -oints
    :b0:iosu::         ; do not convert this string to -ious
    :b0:iotn::         ; do not convert this string to -tion
    :b0:iotns::        ; do not convert this string to -tions
    :b0:itfy::         ; do not convert this string to -tify
    :b0:ityf::         ; do not convert this string to -tify
    :b0:itme::         ; do not convert this string to -time or -items
    :b0:itmes::        ; do not convert this string to -times or -items
    :b0:itng::         ; do not convert this string to -ting
    :b0:itnoal::       ; do not convert this string to -tional
    :b0:iton::         ; do not convert this string to -tion
    :b0:itons::        ; do not convert this string to -tions
    :b0:ivley::        ; do not convert this string to -ively
    :b0:iviyt::        ; do not convert this string to -ivity
    :b0:kaes::         ; do not convert this string to -akes
    :b0:kced::         ; do not convert this string to -cked
    :b0:kcer::         ; do not convert this string to -cker
    :b0:kcers::        ; do not convert this string to -ckers
    :b0:kcet::         ; do not convert this string to -cket
    :b0:kcets::        ; do not convert this string to -ckets
    :b0:kcing::        ; do not convert this string to -cking
    :b0:laized::       ; do not convert this string to -alized
    :b0:laizes::       ; do not convert this string to -alizes
    :b0:lelr::         ; do not convert this string to -ller
    :b0:liity::        ; do not convert this string to -ility
    :b0:liyt::         ; do not convert this string to -lity
    :b0:ltiy::         ; do not convert this string to -lity
    :b0:lzie::         ; do not convert this string to -lize
    :b0:maeg::         ; do not convert this string to -mage
    :b0:maion::        ; do not convert this string to -mation
    :b0:maions::       ; do not convert this string to -mations
    :b0:meents::       ; do not convert this string to -ments
    :b0:menet::        ; do not convert this string to -ment
    :b0:menets::       ; do not convert this string to -ments
    :b0:metn::         ; do not convert this string to -ment
    :b0:metns::        ; do not convert this string to -ments
    :b0:mnets::        ; do not convert this string to -ments
    :b0:mzie::         ; do not convert this string to -mize
    :b0:mzied::        ; do not convert this string to -mized
    :b0:mzies::        ; do not convert this string to -mizes

    :b0:naet::         ; do not convert this string to -nate
    :b0:naets::        ; do not convert this string to -nates
    :b0:necy::         ; do not convert this string to -ency
    :b0:nig::          ; do not convert this string to -ing
    :b0:nigs::         ; do not convert this string to -ings
    :b0:ntaes::        ; do not convert this string to -nates
    :b0:ntiy::         ; do not convert this string to -nity
    :b0:oend::         ; do not convert this string to -oned
    :b0:oeus::         ; do not convert this string to -eous
    :b0:oinal::        ; do not convert this string to -ional
    :b0:oinally::      ; do not convert this string to -ionally
    :b0:oitn::         ; do not convert this string to -oint
    :b0:oitns::        ; do not convert this string to -oints
    :b0:oius::         ; do not convert this string to -ious
    :b0:okcs::         ; do not convert this string to -ocks
    :b0:onit::         ; do not convert this string to -oint
    :b0:onits::        ; do not convert this string to -oints
    :b0:otyr::         ; do not convert this string to -tory
    :b0:pepr::         ; do not convert this string to -pper
    :b0:prot::         ; do not convert this string to -port
    :b0:proted::       ; do not convert this string to -ported
    :b0:proter::       ; do not convert this string to -porter
    :b0:proters::      ; do not convert this string to -porters
    :b0:prots::        ; do not convert this string to -ports
    :b0:raed::         ; do not convert this string to -ared
    :b0:rnat::         ; do not convert this string to -rant
    :b0:rtiy::         ; do not convert this string to -rity
    :b0:oisn::         ; do not convert this string to -sion
    :b0:oisns::        ; do not convert this string to -sions
    :b0:opse::         ; do not convert this string to -pose
    :b0:oudn::         ; do not convert this string to -ound
    :b0:oudns::        ; do not convert this string to -ounds
    :b0:outn::         ; do not convert this string to -ount
    :b0:outns::        ; do not convert this string to -ounts
    :b0:raeg::         ; do not convert this string to -rage
    :b0:remd::         ; do not convert this string to -rmed
    :b0:rila::         ; do not convert this string to -rial
    :b0:rvoe::         ; do not convert this string to -rove
    :b0:rvoed::        ; do not convert this string to -roved
    :b0:rvoes::        ; do not convert this string to -roves
    :b0:saeg::         ; do not convert this string to -sage
    :b0:sehd::         ; do not convert this string to -shed
    :b0:shpi::         ; do not convert this string to -ship
    :b0:soin::         ; do not convert this string to -sion
    :b0:soins::        ; do not convert this string to -sions
    :b0:stiy::         ; do not convert this string to -sity
    :b0:svie::         ; do not convert this string to -sive

    :b0:taed::         ; do not convert this string to -ated
    :b0:taeg::         ; do not convert this string to -tage
    :b0:taion::        ; do not convert this string to -ation
    :b0:taions::       ; do not convert this string to -ations
    :b0:taive::        ; do not convert this string to -ative
    :b0:taoin::        ; do not convert this string to -ation
    :b0:taoins::       ; do not convert this string to -ations
    :b0:tatn::         ; do not convert this string to -tant
    :b0:tatns::        ; do not convert this string to -tants
    :b0:tehr::         ; do not convert this string to -ther
    :b0:tenet::        ; do not convert this string to -tent
    :b0:thces::        ; do not convert this string to -tches
    :b0:tien::         ; do not convert this string to -tine
    :b0:tiens::        ; do not convert this string to -tines
    :b0:tiing::        ; do not convert this string to -iting
    :b0:tiion::        ; do not convert this string to -ition
    :b0:tiioning::     ; do not convert this string to -itioning
    :b0:tiions::       ; do not convert this string to -itions
    :b0:tiive::        ; do not convert this string to -itive
    :b0:tiives::       ; do not convert this string to -itives
    :b0:tiosn::        ; do not convert this string to -tions
    :b0:tnat::         ; do not convert this string to -tant
    :b0:tnats::        ; do not convert this string to -tants
    :b0:tnation::      ; do not convert this string to -ntation
    :b0:tnations::     ; do not convert this string to -ntations
    :b0:tned::         ; do not convert this string to -nted
    :b0:toin::         ; do not convert this string to -tion
    :b0:toins::        ; do not convert this string to -tions
    :b0:tped::         ; do not convert this string to -pted
    :b0:tpion::        ; do not convert this string to -ption
    :b0:tpions::       ; do not convert this string to -ptions
    :b0:tsed::         ; do not convert this string to -sted
    :b0:tsic::         ; do not convert this string to -stic
    :b0:tsics::        ; do not convert this string to -stics
    :b0:tuer::         ; do not convert this string to -ture
    :b0:tuerd::        ; do not convert this string to -tured
    :b0:tuers::        ; do not convert this string to -tures
    :b0:tues::         ; do not convert this string to -utes
    :b0:tuion::        ; do not convert this string to -ution
    :b0:tuions::       ; do not convert this string to -utions
    :b0:tvie::         ; do not convert this string to -tive
    :b0:ullly::        ; do not convert this string to -ully
    :b0:ulyl::         ; do not convert this string to -ully
    :b0:utls::         ; do not convert this string to -ults
    :b0:vaets::        ; do not convert this string to -vates
    :b0:vtiy::         ; do not convert this string to -vity
    :b0:wrae::         ; do not convert this string to -ware
    {
        ; see bottom of script for examples of these suffixes
    }

    ; PRIMARY AUTOCORRECT LIST
    ; Autocorrect these strings.
    ; Basic syntax -> ::oldString::newString

    :C:#Include::{#}include         ; directive in C/C++. '#' on RHS must be escaped by enclosing in '{}'
    :C:#Pragma::{#}pragma           ; directive in C/C++

    ::alot::a lot
    ::abotu::about
    ::aobut::about
    ::baout::about
    ::abvoe::above
    ::absoltue::absolute
    :*:abstarct::abstract           ; abstract/s, abstracted, abstraction/s
    ::accetp::accept
    ::accetps::accepts
    :*:acceess::access
    :*:accomodat::accommodat        ; accommodate/s/d, accommodating
    ::accomplihs::accomplish
    ::accomplihses::accomplishes
    :*:acount::account              ; account/s/ed/ing/able
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
    ::activaet::activate
    ::actula::actual
    ::acutal::actual
    :*:adress::address              ; address/ed/es/ing/able
    ::adjancecy::adjacency
    ::adjancency::adjacency
    ::adjacnet::adjacent
    ::adjancent::adjacent
    :*:ajdust::adjust               ; adjust/s/ed/ing/ment
    ::adminstrator::administrator
    ::administator::administrator
    ::adminstrators::administrators
    ::administators::administrators
    ::advnatage::advantage
    ::advnatages::advantages
    ::agian::again
    ::agetns::agents
    ::aggrivate::aggravate
    ::aehad::ahead
    ::algoirthm::algorithm
    ::algorihtm::algorithm
    ::algoirhtm::algorithm
    ::algroithm::algorithm
    ::algortihm::algorithm
    ::algoirthms::algorithms
    ::algorihtms::algorithms
    ::algoirhtms::algorithms
    ::algroithms::algorithms
    ::algortihms::algorithms
    ::alais::alias
    ::alaises::aliases
    :C:alvie::alive
    ::allcoate::allocate
    ::allcoated::allocated
    ::allcoates::allocates
    :*:allwo::allow                 ; allow/s/ed/ing/able
    ::almsot::almost
    :*:alhpa::alpha                 ; alpha/bet/betize/numeric
    ::alraedy::already
    ::alrady::already
    ::alreayd::already
    ::laready::already
    ::alerady::already
    ::alos::also
    ::alhtough::although
    ::alwasy::always
    ::analagous::analogous
    :C:adn::and
    :C:Adn::And
    :C:nad::and
    :C:ANd::And
    ::andthe::and the
    ::antoehr::another
    ::antoher::another
    ::ansewr::answer
    ::ansewred::answered
    ::ansewrs::answers
    ::anhyting::anything
    ::anyhting::anything
    ::appearence::appearance
    ::appearences::appearances
    ::appedn::append
    ::appication::application
    ::appilcation::application
    ::aplication::application
    ::appications::applications
    ::appilcations::applications
    ::aplications::applications
    :*:apporach::approach           ; approach/es/ed/ing
    ::arhitecture::architecture
    ::archtiecture::architecture
    ::archvie::archive
    ::archvied::archived
    ::archvies::archives
    ::arugment::argument
    ::arguement::argument
    ::arguent::argument
    ::arugments::arguments
    ::arguements::arguments
    ::arguents::arguments
    ::arithemtic::arithmetic
    ::aorund::around
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
    :C:asserT::assert               ; holding shift and about to type '(' in: 'assert('
    :*:asesrt::assert
    :*:assesrt::assert
    :*:asser(::assert(
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
    :*:assocait::associat           ; ex: associat/e/es/ing/ive
    ::assoicative::associative
    ::assuem::assume
    ::asycn::async
    ::asynchornous::asynchronous
    ::asychrnous::asynchronous
    ::asynchornously::asynchronously
    ::asychrnously::asynchronously
    ::atmoic::atomic
    :*:atach::attach                ; ex: attach/ed/es/ment
    :*:attahc::attach
    ::attakc::attack
    ::attakcs::attacks
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
    ::automted::automated
    ::avialable::available
    ::aveareg::average
    ::aveage::average
    ::avearge::average
    ::avearegs::averages
    ::aveages::averages
    ::avearges::averages
    ::awiat::await
    ::awkae::awake

    ::backgorund::background
    ::backgournd::background
    ::bakcload::backload
    ::bakclog::backlog
    ::bakcspace::backspace
    ::bakctrack::backtrack
    ::bakctracking::backtracking
    ::bakctracks::backtracks
    ::bakcward::backward
    ::backwrad::backward
    ::backwrads::backwards
    ::blanace::balance
    ::blaance::balance
    ::blanaced::balanced
    ::blaanced::balanced
    ::blanaces::balances
    ::blaances::balances
    ::bandwith::bandwidth
    ::badnwidth::bandwidth
    ::bandiwdth::bandwidth
    ::baselien::baseline
    ::baseilne::baseline
    ::bahs::bash
    ::becaues::because
    ::becasue::because
    ::becuase::because
    ::becauase::because
    ::becaseu::because
    ::beccause::because
    ::beacuse::because
    ::becuse::because
    ::becaue::because
    ::beocme::become
    ::beocmes::becomes
    ::becomse::becomes
    ::beofre::before
    ::befoer::before
    ::begni::begin
    ::begnis::begins
    ::behaivor::behavior
    ::behvaior::behavior
    ::behaior::behavior
    ::behaivors::behaviors
    ::behvaiors::behaviors
    ::behaiors::behaviors
    ::bheind::behind
    ::bleow::below
    :*:benhcmark::benchmark         ; benchmark/s/ed/ing
    :*:bnehcmark::benchmark
    :*:benchmakr::benchmark
    :*:bnechmark::benchmark
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
    ::borken::broken
    ::broekn::broken
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
    :*:clalback::callback
    ::caleld::called
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
    ::cannonical::canonical
    ::canoncial::canonical
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
    ::certian::certain
    ::cahining::chaining
    ::chaingn::chaining
    ::chagne::change
    ::cahnge::change
    ::chagned::changed
    ::cahnged::changed
    ::chagnes::changes
    ::cahnges::changes
    ::chracter::character
    ::charcter::character
    ::charcater::character
    ::charater::character
    ::characteres::characters
    ::chracters::characters
    ::charcters::characters
    ::charcaters::characters
    ::charaters::characters
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
    ::chorme::chrome
    ::cihper::cipher
    ::cihpertext::ciphertext
    ::circuti::circuit
    ::circutis::circuits
    ::clagn::clang
    ::clairfied::clarified
    ::clairfy::clarify
    ::clairfying::clarifying
    ::clas::class
    ::clss::class
    ::clasdef::classdef
    ::clsses::classes
    ::clasifier::classifier
    ::classifer::classifier
    ::clasifiers::classifiers
    ::classifers::classifiers
    ::caluse::clause
    ::cluase::clause
    ::caluses::clauses
    ::cluases::clauses
    ::clena::clean
    ::clenas::cleans
    ::claer::clear
    ::claers::clears
    ::clickc::click
    ::clikc::click
    ::lcick::click
    ::clickcs::clicks
    ::clikcs::clicks
    ::lcicks::clicks
    ::clinet::client
    ::clinets::clients
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
    ::companeis::companies
    ::comapre::compare
    ::comprae::compare
    ::comapred::compared
    ::comapres::compares
    ::comparision::comparison
    ::compariosn::comparison
    ::comparisions::comparisons
    ::compariosns::comparisons
    ::compatabilities::compatibilities
    ::compatability::compatibility
    ::compatable::compatible
    ::competitve::competitive
    ::comiplation::compilation
    :*:comiple::compile             ; compile/r/d/s
    :*:compiel::compile
    ::comiler::compiler
    ::compliers::compilers
    ::compileres::compilers
    ::comilers::compilers
    ::compeltion::completion
    ::compelx::complex
    ::compelxity::complexity
    ::compleixty::complexity
    ::comopnent::component
    ::componet::component
    ::comopnents::components
    ::componets::components
    ::compsoe::compose
    ::compsoes::composes
    ::composeite::composite
    ::comopsition::composition
    :*:compormis::compromis         ; compromis/e/ed/es/ing
    :*:comptue::compute             ; compute/r/s/d/rs
    :*:ocmpute::compute
    :*:cmopute::compute
    ::concatneate::concatenate
    ::concatneated::concatenated
    ::concatneates::concatenates
    ::concetp::concept
    ::concetps::concepts
    ::conceptula::conceptual
    ::conceputal::conceptual
    ::ocncurrency::concurrency
    ::ocncurrent::concurrent
    ::ocncurrently::concurrently
    :*:ocndition::condition         ; condition/s/ed/al/ing
    :*:condiion::condition
    ::condiitonals::conditionals    ; singular form covered by a suffix rule
    ::confidentality::confidentiality
    :*:ocnfig::config               ; config/ure/urable/uration
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
    ::constratin::constraint
    ::constraitn::constraint
    ::constriant::constraint
    ::constratins::constraints
    ::constraitns::constraints
    ::constriants::constraints
    :*:consturct::construct         ; construct/s/ed/or/ing
    ::constuctor::constructor
    ::consutl::consult
    ::consuem::consume
    ::consuemr::consumer
    ::consuemrs::consumers
    ::consuems::consumes
    ::contian::contain
    ::contina::contain
    ::ocntain::contain
    ::contianer::container
    ::contaienr::container
    ::continaer::container
    ::ocntainer::container
    ::contianers::containers
    ::contaienrs::containers
    ::continaers::containers
    ::ocntainers::containers
    ::contians::contains
    ::continas::contains
    ::ocntains::contains
    ::cnotent::content
    ::cnotents::contents
    :*:contniu::continu             ; continu/e/ous/ously/ally
    :*:conitnu::continu
    ::contineu::continue
    ::ocntinue::continue
    ::conintue::continue
    ::contineud::continued
    ::ocntinued::continued
    ::conintued::continued
    ::contineus::continues
    ::ocntinues::continues
    ::conintues::continues
    :*:contirbut::contribut         ; contribute/d/s, contributor
    ::contribtue::contribute
    ::contriubte::contribute
    ::contriubtes::contributes
    :*:contorl::control             ; control/s/led/ler/ling
    :*:ocntrol::control
    ::convet::convert
    ::convets::converts
    ::convertes::converts
    ::cookei::cookie
    ::cookeis::cookies
    ::coordiante::coordinate
    ::coordiantes::coordinates
    ::copeid::copied
    ::copeis::copies
    ::cpoy::copy
    ::coyp::copy
    ::copyrgiht::copyright
    ::corenr::corner
    ::corenrs::corners
    :*:corect::correct              ; correct/ed/ion/tly/ness
    :*:corretc::correct
    ::corresopnd::correspond
    ::correspodn::correspond
    ::corresopnded::corresponded
    ::corresopnds::corresponds
    ::correspodns::corresponds
    ::coudl::could
    ::coudln't::couldn't
    :*:coutn::count                 ; count/s/ed/er/ing, countVarName
    :*:ocunt::count
    ::cuople::couple
    ::covearge::coverage
    ::coveage::coverage
    :*:crahs::crash                 ; crash/es/ed/ing
    :*:carsh::crash
    ::crasehs::crashes
    ::cralwer::crawler              ; web crawler
    ::creat::create                 ; note: there exists a legacy C syscall called 'creat'
    ::creaete::create
    ::creaet::create
    ::creatd::created
    ::creaeted::created
    ::creats::creates
    ::creaetes::creates
    ::criteira::criteria
    ::crtieria::criteria
    ::ciritcal::critical
    ::criitcal::critical
    :*:crytpo::crypto               ; cryptography, cryptographic/ally
    :C:CTrl::Ctrl                   ; 'Control' keyboard modifier
    ::curent::current
    ::currenet::current
    ::currrent::current
    ::currnet::current
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
    :C:DAta::Data
    ::databse::database
    ::databaes::database
    ::datbase::database
    ::databses::databases
    ::datbases::databases
    ::dataest::dataset
    ::dataests::datasets
    ::deactivaet::deactivate
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
    :*:dleete::delete               ; delete/s/d/r
    ::deletd::deleted
    ::dleetion::deletion
    ::dleetions::deletions
    ::dleivery::delivery
    :*:dmeonstrat::demonstrat       ; demonstrat/e/s/ing/ion/ive
    :*:dpeend::depend               ; depends, dependency, dependence, dependencies
    :*:depenenc::dependenc
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
    ::descrbie::describe
    ::descirbe::describe
    ::descrbied::described
    ::descirbed::described
    ::descrbies::describes
    ::descirbes::describes
    ::desing::design
    ::deisgn::design
    ::deisng::design
    ::desinged::designed
    ::deisgned::designed
    ::deisnged::designed
    ::desinging::designing
    ::deisgning::designing
    ::deisnging::designing
    ::desings::designs
    ::deisgns::designs
    ::deisngs::designs
    ::destiation::destination
    ::destiations::destinations
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
    ::dictoinary::dictionary
    ::dictoniary::dictionary
    ::din'dt::didn't
    ::dind't::didn't
    ::didnt'::didn't
    ::idff::diff
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
    :*:diigt::digit                 ; digit/s/al/ally
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
    ::dispalyed::displayed
    ::idsplayed::displayed
    ::dispalys::displays
    ::idsplays::displays
    :*:distni::distin               ; distinct/ion, distinguish/ing/ability
    ::distribtue::distribute
    ::distriuted::distributed
    ::distirbuted::distributed
    ::distribued::distributed
    ::distriubtion::distribution
    ::distirbution::distribution
    ::distriubtions::distributions
    ::distirbutions::distributions
    ::od not::do not
    :*:docment::document            ; document/s/ed/ation
    :*:odcument::document
    :*:doucment::document
    :*:documentn::document
    :*:documnt::document
    ::doesn ot::does not
    ::doe snot::does not
    ::doesnt'::doesn't
    ::doens't::doesn't
    ::doenst::doesn't
    ::doen'st::doesn't
    ::dont::don't
    ::doubel::double
    ::doubeld::doubled
    ::doubels::doubles
    ::donwload::download
    ::donwloaded::downloaded
    ::donwloads::downloads
    ::downsream::downstream
    ::donwstream::downstream
    ::darw::draw
    ::darwing::drawing
    ::drvie::drive
    ::drvien::driven
    ::drvies::drives
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
    ::dyanmic::dynamic
    ::dyanmics::dynamics

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
    ::edidtor::editor
    ::eidtors::editors
    ::ediotrs::editors
    ::editros::editors
    ::edidtors::editors
    ::edidts::edits
    ::eidts::edits
    :*:eigne::eigen                 ; eigen/space/value/vector
    ::iether::either
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
    ::esle::else
    ::elsei f::else if
    ::esleif::elseif
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
    ::enbale::enable
    ::enbaled::enabled
    ::enbales::enables
    ::encapuslation::encapsulation
    ::encoutner::encounter
    :C:ENd::End                     ; common Visual Basic keyword
    :C:enld::endl                   ; C++ newline (endline)
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
    ::enuogh::enough
    ::ensrue::ensure
    ::ensrues::ensures
    :*:ential::entail               ; ential/s/ed/ing/ment
    ::enttiy::entity
    ::entiyt::entity
    ::enitty::entity
    ::entroyp::entropy
    ::enumeate::enumerate
    ::enumeated::enumerated
    ::enumeates::enumerates
    ::envrion::environ              ; Python's 'os.environ' parameter
    ::enviorn::environ
    ::envirno::environ
    ::enviroment::environment
    ::envrionment::environment
    ::enviornment::environment
    ::envirnoment::environment
    ::enviroments::environments
    ::envrionments::environments
    ::enviornments::environments
    ::envirnoments::environments
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
    ::evne::even
    ::evenet::event
    ::evenets::events
    ::eventes::events
    ::eventula::eventual
    ::evenutal::eventual
    ::evvery::every
    ::eveyrone::everyone
    ::everyting::everything
    ::everytyhing::everything
    ::everthing::everything
    ::evertyhing::everything
    ::everywehre::everywhere
    ::everywheer::everywhere
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
    ::excahnge::exchange
    ::exchagne::exchange
    ::excahnged::exchanged
    ::exchagned::exchanged
    ::excahnges::exchanges
    ::exchagnes::exchanges
    :*:exeuct::execut               ; execut/e/ing/ion/able
    ::exectable::executable
    ::exectuable::executable
    ::exectables::executables
    ::exectuables::executables
    ::exectue::execute
    ::exectuer::executer            ; exception for '-tuer' -> '-ture'
    ::exectuers::executers
    ::exeution::execution
    ::execuion::execution
    ::exhausive::exhaustive
    ::existance::existence
    ::exapnd::expand
    ::exapnded::expanded
    ::exapnds::expands
    ::expanison::expansion
    ::expectd::expected
    :*:exepri::experi               ; experience/s/d, experiment/s/ed/ation
    :*:expeir::experi
    ::exipry::expiry
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
    ::expreession::expression
    ::expresisons::expressions
    ::expresions::expressions
    ::exprssions::expressions
    ::expreessions::expressions
    ::extedn::extend
    ::exetnd::extend
    ::exetnded::extended
    ::exetnds::extends
    ::extnesion::extension
    ::extnesions::extensions
    ::externla::external
    ::extenral::external
    ::exteranl::external

    ::faield::failed
    ::failrue::failure
    ::fialure::failure
    ::fialrue::failure
    ::failrues::failures
    ::fialures::failures
    ::fialrues::failures
    ::fiarly::fairly
    ::fkae::fake
    ::fkaed::faked
    ::fallthrouhg::fallthrough
    ::flase::false
    ::aflse::false
    :C:fales::false                 ; case-sensitive to preserve 'Fales' surname
    ::fasle::false
    :C:FAlse::False
    ::fautl::fault
    ::favoriet::favorite
    ::favoirte::favorite
    ::favortie::favorite
    ::favoriets::favorites
    ::favoirtes::favorites
    ::favorties::favorites
    :*:feasab::feasib               ; feasible, feasibly, feasibility
    ::faeture::feature
    ::faetured::featured
    ::faetures::features
    ::fethc::fetch
    ::fecth::fetch
    ::fecthed::fetched
    ::fecthes::fetches
    ::fibonnaci::fibonacci          ; fibonacci sequence, fibonacci heap
    ::fiedl::field
    ::fiedls::fields
    ::fiel::file
    ::ifle::file
    ::fiels::files
    ::ifles::files
    ::fielsystem::filesystem
    ::iflesystem::filesystem
    ::filesytem::filesystem
    ::filesytsem::filesystem
    ::finaly::finally
    ::finaincial::financial
    ::fidn::find
    :C:FInd::Find
    ::fidns::finds
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
    ::fodler::folder
    ::fodlers::folders
    ::fodling::folding
    :*:folow::follow                ; follow/s/ed/er/ing
    :C:ofr::for                     ; 'for' keyword
    :C:FOr::For
    ::fo rthe::for the
    ::fort he::for the
    ::fo rteh::for the
    ::for th::for the
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
    :C:forSOme::forSome             ; Scala keyword
    ::forwared::forward
    ::forwareds::forwards
    :*:foudn::found                 ; found/ation/ational
    ::founation::foundation
    ::fpritnf::fprintf              ; common file formatting function
    :*:framgent::fragment           ; fragment/s/ed/ing/ation
    ::frmae::frame
    ::frmaed::framed
    ::frmaes::frames
    ::frmaework::framework
    :*:freuqen::frequen             ; frequen/t/cy/tly
    :*:frquen::frequen
    ::freuent::frequent
    ::freuently::frequently
    ::firend::friend
    ::freind::friend
    ::firends::friends
    ::freinds::friends
    :C:FRom::From
    ::frmo::from
    ::fornt::front
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
    :*:fuctnion::function
    ::functioal::functional
    ::funadmental::fundamental
    ::fudnamental::fundamental
    ::funadmentals::fundamentals
    ::fudnamentals::fundamentals

    ::gatewya::gateway
    ::gatewyas::gateways
    ::guage::gauge
    ::guaged::gauged
    ::guages::gauges
    ::gausian::gaussian
    ::guassian::gaussian
    ::guasian::gaussian
    ::gvie::give
    ::gvien::given
    ::givne::given
    ::glithc::glitch
    ::glboal::global
    ::glboally::globally
    ::glboals::globals
    ::goe sto::goes to
    ::oging::going
    ::going ot::going to
    ::goot::goto
    ::gradiet::gradient
    :C:grammer::grammar             ; case sensitive to preserve 'Grammer' surname
    ::gratner::granter
    ::gratners::granters
    :*:grpah::graph                 ; graphs, graphing, graphics
    :*:grahp::graph
    :*:garph::graph
    ::gerat::great
    ::gretaer::greater
    ::gredy::greedy
    ::gorund::ground
    ::gournd::ground
    ::gorunds::grounds
    ::gournds::grounds
    :*:gorup::group                 ; group/s/ed/ing
    :*:gropu::group

    ::hlaf::half
    ::hadnle::handle
    ::hadnles::handles
    ::hadnling::handling
    ::harenss::harness              ; test harness
    :C:hsa::has
    :C:Hsa::Has
    :C:HAs::Has
    :*:hahs::hash                   ; hash/es/ed/ing/map/table
    ::hvae::have
    ::ahve::have
    ::haev::have
    :C:HAve::Have
    ::have ot::have to
    ::have'nt::haven't
    ::havn'et::haven't
    ::havne't::haven't
    ::ahven't::haven't
    ::hvaen't::haven't
    ::haevn't::haven't
    ::haven'et::haven't
    ::helath::health
    ::helathy::healthy
    ::hieght::height
    ::heihgt::height
    ::hieghts::heights
    ::heihgts::heights
    ::heruistic::heuristic
    ::heruistics::heuristics
    ::hiddne::hidden
    ::heirarchy::hierarchy
    ::hierarhcy::hierarchy
    ::hihg::high
    ::hihger::higher
    ::hightest::highest
    ::hihgest::highest
    ::highets::highest
    ::hodler::holder
    ::hodlers::holders
    ::hoem::home
    :C:horus::hours
    :C:HOw::How
    ::howthe::how the
    ::howto::how to
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
    :*:idemopten::idempoten         ; idempoten/t/ce/cy
    ::identtiy::identity
    ::identiyt::identity
    ::idenitty::identity
    ::fi it::if it
    ::fi that::if that
    ::fi the::if the
    ::fi these::if these
    ::fi they::if they
    ::fi this::if this
    ::fi those::if those
    ::fi you::if you
    :*:igonr::ignor                 ; ignor/e/es/ed/ing
    ::iamge::image
    ::imaeg::image
    ::iamges::images
    ::imblanace::imbalance
    ::imblaance::imbalance
    ::imblanaced::imbalanced
    ::imblaanced::imbalanced
    ::immutabel::immutable
    ::imutable::immutable
    :*:imapct::impact               ; impact/s/ed/ful
    ::impereative::imperative
    :*:implmenet::implement         ; implement/s/ation/ations
    :*:implmeent::implement
    :*:impelement::implement
    ::implemenation::implementation
    ::implemenations::implementations
    ::implciit::implicit
    :*:imoprt::import               ; import/s/ed/er
    ::impot::import
    ::imporant::important
    ::impots::imports
    ::imposible::impossible
    ::imposisble::impossible
    ::i na::in a
    ::i nan::in an
    ::i nrange::in range            ; Python loop
    ::inthe::in the
    ::in th::in the
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
    ::incrase::increase
    ::incrased::increased
    ::incrases::increases
    :*:icnrement::increment         ; increment/s/al/ed/ing
    :*:incrment::increment
    ::indpeendent::independent
    ::independant::independent
    ::indpeendently::independently
    ::independantly::independently
    ::independnetly::independently
    :*:idnex::index                 ; index/ed/es/ing
    :*:indeex::index
    :*:nidex::index
    :*:indistnig::indisting         ; indistinguishable, indistinguishability
    ::ineequality::inequality
    :*:infeasab::infeasib           ; infeasible, infeasibility
    ::inifnity::infinity
    ::inof::info
    :*:inofrmati::informati         ; informati/on/ve/cs/onal
    :*:ifnormati::informati
    :*:infreuqen::infrequen         ; infrequen/t/tly
    :*:infrquen::infrequen
    :*:inherti::inherit             ; inherit/s/ance
    :*:inhreit::inherit
    :*:intiial::initial             ; initial, initialize/d, initialization
    :*:inital::initial
    ::initaited::initiated
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
    ::instnace::instance
    ::intances::instances
    ::instnaces::instances
    ::instantaited::instantiated
    ::isntead::instead
    ::intsead::instead
    ::intead::instead
    ::instad::instead
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
    ::intercetps::intercepts
    ::interafce::interface
    ::inteface::interface
    ::interafces::interfaces
    ::intefaces::interfaces
    ::internla::internal
    ::intenral::internal
    ::interanl::internal
    ::internlas::internals
    ::intenrals::internals
    ::interanls::internals
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
    :*:introuce::introduce          ; introduce/s/d
    ::intutive::intuitive
    ::invlaid::invalid
    ::invariatn::invariant
    ::ivnariant::invariant
    ::invariatns::invariants
    ::ivnariants::invariants
    ::invesre::inverse
    ::invertable::invertible
    ::iosream::iostream             ; C++ I/O header
    ::iosteam::iostream
    ::isotream::iostream
    ::isthe::is the
    ::is ot::is to
    ::isintance::isinstance         ; Python function
    ::ins't::isn't
    ::isnt'::isn't
    ::sin't::isn't
    ::is'nt::isn't
    ::isseu::issue
    ::isseud::issued
    ::isseus::issues
    ::it ot::it to
    ::i'ts::it's
    ::iteation::iteration
    ::itereation::iteration
    ::iteraion::iteration
    ::iteations::iterations
    ::itereations::iterations
    ::iteraions::iterations
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
    ::jion::join
    ::jioned::joined
    ::jioning::joining
    ::jions::joins
    ::jorunal::journal
    ::jounral::journal
    ::journla::journal
    ::jouranl::journal
    ::jorunals::journals
    ::jounrals::journals
    ::journlas::journals
    ::jouranls::journals
    ::jsut::just

    ::keywrod::keyword
    ::keywrods::keywords
    ::kidn::kind
    ::kidns::kinds
    :*:knwo::know                   ; ex: know/s/n/ing/ledge
    :*:konw::know
    :*:nkow::know
    ::knowlege::knowledge
    ::knowlegeable::knowledgeable

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
    ::alrge::large
    ::alrger::larger
    ::largets::largest
    ::alrgest::largest
    :*:lauchn::launch               ; launch/es/ed/ing
    ::leadre::leader
    ::laeder::leader
    ::laeders::leaders
    :*:leran::learn                 ; learn/s/ed/ing
    :*:laern::learn
    ::lesat::least
    ::elft::left                    ; binary tree left/right
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
    ::librarry::library
    ::liek::like
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
    ::linkaeg::linkage
    ::linekd::linked
    ::linekr::linker
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
    ::listenr::listener
    ::listenrs::listeners
    ::lsits::lists
    ::ilsts::lists
    ::lvie::live
    ::lokc::lock
    ::logairthm::logarithm
    ::lgoical::logical
    ::loign::login
    ::logner::longer
    ::longets::longest
    ::lognest::longest
    ::lookaisde::lookaside          ; translation lookaside buffer (TLB)
    :*:looop::loop                  ; loop/s/ed/ing
    ::lsot::lost
    ::lwoer::lower
    ::lwoercase::lowercase
    ::loweset::lowest
    ::lwoest::lowest

    ::mahcine::machine
    ::machien::machine
    ::macine::machine
    ::machine leaning::machine learning
    ::machins::machines
    ::mahcines::machines
    ::machiens::machines
    ::macines::machines
    ::macintohs::macintosh
    ::maintian::maintain
    ::maintianing::maintaining
    ::maintians::maintains
    ::mjaor::major
    ::majoritiy::majority
    ::mkae::make
    ::maek::make
    ::amke::make
    ::maeks::makes
    ::amkes::makes
    ::maloc::malloc
    :*:manaeg::manage               ; manage/r/d/rs/ment/eable
    :*:mangae::manage
    :*:maange::manage
    :*:manfactur::manufactur        ; manufactur/ed/er/ing
    ::mnay::many
    ::marign::margin
    ::marigns::margins
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
    ::menas::means
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
    ::microsfot::microsoft
    ::millino::million
    ::millinos::millions
    ::minmal::minimal
    ::mininum::minimum
    ::minmum::minimum
    ::minoritiy::minority
    ::mismtach::mismatch
    ::misisng::missing
    ::mispell::misspell
    ::mdoe::mode
    ::modle::model
    ::mdoel::model
    ::modles::models
    ::mdoels::models
    ::mdoes::modes
    ::moduel::module
    ::modlue::module
    ::moduels::modules
    ::modlues::modules
    :*:monitro::monitor             ; monitor/s/ed/ing
    ::mroe::more
    ::omre::more
    ::moer::more
    ::msot::most
    ::mosue::mouse
    ::mvoe::move
    ::mvoed::moved
    ::mvoes::moves
    ::muhc::much
    :*:mlti::multi                  ; multi/threaded/plex/process/tasking/ply
    :*:mjulti::multi
    :*:mulitp::multip
    ::multipel::multiple
    ::multipleid::multiplied
    ::multipleir::multiplier
    ::multiproceessing::multiprocessing
    ::multiporcessing::multiprocessing
    ::msut::must
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
    ::namepsace::namespace
    ::naer::near
    ::naerly::nearly
    ::nealry::nearly
    :*:entwork::network             ; network/s/ed/ing
    ::nerual::neural
    ::enxt::next
    :C:onde::node
    :C:ndoe::node
    ::ondes::nodes
    ::ndoes::nodes
    :C:NOne::None                   ; Python keyword
    :*:northwset::northwest
    :C:Nto::Not
    :C:nto::not
    :C:NOt::not
    ::ntoe::note
    ::ntoed::noted
    ::ntoepad::notepad
    ::ntoes::notes
    ::nohting::nothing
    ::notifcation::notification
    ::nulll::null
    ::nulopt::nullopt               ; C++ keyword
    ::nulllopt::nullopt
    ::nulptr::nullptr               ; C++ keyword
    ::nulllptr::nullptr
    ::nubmer::number
    ::numbesr::numbers
    :*:nuemr::numer                 ; ex: numerator, numeric, numeral

    :*:ojbect::object               ; object/s, objective/s
    :*:obejct::object
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
    ::ofthe::of the
    ::ofteh::of the
    ::ofhte::of the
    ::fo the::of the
    ::oft he::of the
    ::of th::of the
    ::ofthis::of this
    ::offiical::official
    ::offical::official
    ::onthe::on the
    ::oens::ones
    ::onlly::only
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
    ::optioal::optional
    ::optinoal::optional
    ::optinoally::optionally
    :*:odrer::order                 ; order/s/ed/ing
    ::ordianry::ordinary
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
    ::outocme::outcome
    ::outocmes::outcomes
    ::outcomse::outcomes
    ::otuer::outer                  ; exception for '-tuer' -> '-ture'
    ::otuput::output
    ::ouptut::output
    ::otuputs::outputs
    ::ouptuts::outputs
    ::overlfow::overflow
    ::overlfowed::overflowed
    ::overlfows::overflows
    ::overhaed::overhead
    ::overiden::overridden
    ::overidden::overridden
    ::overriden::overridden
    ::overide::override             ; cannot do ':*:' b/c of words like overidealize and overidentify
    ::overides::overrides
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
    ::pallette::palette             ; ex: VSCode Command Palette
    ::paralel::parallel
    ::parllel::parallel
    ::aprallel::parallel
    ::parlalel::parallel
    ::praallel::parallel
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
    ::praents::parents
    ::parenets::parents
    ::aprents::parents
    :*:pasre::parse                 ; parse/d/s/r
    ::parital::partial
    :*:paritc::partic               ; partic/ipant/ipate/ular
    ::participnat::participant
    ::participnats::participants
    ::parituclar::particular
    ::partiuclar::particular
    :*:partiton::partition          ; partition/s/ed/ing
    :*:parittion::partition
    ::pasive::passive
    ::passwrod::password
    ::pasword::password
    ::passowrd::password
    ::passwrods::passwords
    ::paswords::passwords
    ::passowrds::passwords
    ::paht::path
    ::pahtlib::pathlib
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
    ::performnat::performant
    ::perofmrant::performant
    ::perihperal::peripheral
    ::perihperals::peripherals
    ::permanet::permanent
    ::permenant::permanent
    ::permanant::permanent
    ::perimt::permit
    ::perimts::permits
    ::perimtted::permitted
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
    ::paln::plan
    ::planend::planned
    ::palns::plans
    ::platfom::platform
    ::platfoms::platforms
    ::playesr::players
    ::pleae::please
    ::pleaes::please
    ::plto::plot
    ::pltos::plots
    ::pluign::plugin
    ::pluigns::plugins
    ::pionter::pointer
    ::poitner::pointer
    ::opinter::pointer
    ::pionters::pointers
    ::poitners::pointers
    ::opinters::pointers
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
    ::pratice::practice
    ::praticed::practiced
    ::pratices::practices
    ::prgama::pragma                ; #pragma
    ::prealocate::preallocate
    ::prealocates::preallocates
    :*:preceede::precede            ; precede/d/s/nce/nts
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
    :*:prpear::prepar               ; prepar/e/es/ed/ation
    :*:preprae::prepare
    :*:preporcess::preprocess       ; preprocess/es/or/ing
    ::preprocesor::preprocessor
    ::presetner::presenter
    ::presetners::presenters
    :*:prserve::preserve            ; preserve/s/d/r
    ::prevelant::prevalent
    :*:prevetn::prevent             ; prevent/s/ed/ion/able
    :*:prvent::prevent
    :*:prevenet::prevent
    ::preivous::previous
    ::primarly::primarily
    ::pirmary::primary
    ::priamry::primary
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
    ::processesd::processed
    ::proceses::processes
    ::procesing::processing
    ::procesor::processor
    :*:proudce::produce             ; produce/d/r/s/rs
    :*:prdouce::produce
    :*:prodcue::produce
    ::produer::producer
    ::produers::producers
    :*:proudct::product             ; product/s/ion/ive/ivity
    :*:prdouct::product
    :*:proflie::profile             ; profile/d/s/r
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
    ::proeprties::properties
    ::propeties::properties
    ::proeprty::property
    ::propety::property
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
    :*:pesudo::pseudo               ; pseudocode, pseudorandom
    :*:psuedo::pseudo
    ::pubilc::public
    :*:publihs::publish             ; publish/ed/er/es/ing
    ::puhs::push
    :C:push+back::push_back         ; common C++ container function
    ::puhses::pushes
    ::pythno::python
    ::pyton::python
    ::pythohn::python
    :C:PYthon::Python
    ::pyhton::python
    ::pytohn::python

    ::qualyit::quality
    ::quanitty::quantity
    ::quanttiy::quantity
    ::quantiyt::quantity
    ::qeuried::queried
    ::queired::queried
    ::quried::queried
    ::qeuries::queries
    ::queires::queries
    ::quries::queries
    :*:queyr::query                 ; query/ing, queryArgs, queryParameters
    :*:qeury::query
    ::qury::query
    :*:qustion::question            ; question/s/ed/ing/able
    :*:quetion::question
    :*:quetsion::question
    ::queu::queue
    ::qeuue::queue
    ::qeueu::queue
    ::queud::queued
    ::qeuued::queued
    ::qeueud::queued
    ::queus::queues
    ::qeuues::queues
    ::qeueus::queues
    :*:qiuck::quick                 ; quickly, quicksort, quickselect
    :*:quikc::quick
    ::quickyl::quickly
    ::quicly::quickly
    ::quicksleect::quickselect

    ::riase::raise
    ::riased::raised
    ::riases::raises
    :*:ranodm::random               ; random/ly/ise/ize/ization
    :*:rnadom::random
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
    ::raedy::ready
    ::rela::real
    ::relaly::really
    ::rebulid::rebuild
    ::rebiuld::rebuild
    ::rebulids::rebuilds
    ::rebiulds::rebuilds
    :*:reciev::receiv               ; receiv/able/e/ed/er/ing
    ::receivs::receives
    :*:recognies::recognise         ; recognise/s/ed/er
    :*:recogniez::recognize         ; recognize/s/ed/er
    ::reconcileable::reconcilable
    ::recrod::record
    ::recroded::recorded
    ::recroding::recording
    ::recrods::records
    ::rectnagle::rectangle
    ::recntagle::rectangle
    ::rectangel::rectangle
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
    ::reudctions::reductions
    ::redundnat::redundant
    :*:refator::refactor            ; refactor/s/ed/ing
    :*:refernce::reference          ; reference/s/r/d
    :*:refrence::reference
    ::referal::referral
    ::referals::referrals
    ::refersh::refresh
    ::refershed::refreshed
    ::refershes::refreshes
    :*:registser::register          ; register/s/ed/ing
    ::regresion::regression
    ::regresions::regressions
    ::reuglar::regular
    ::reimaeg::reimage
    ::reinforcment::reinforcement
    :*:rleation::relation           ; relations, relational, relationships
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
    ::remnnat::remnant
    :*:rmeove::remove               ; remove/s/d/r
    :*:remvoe::remove
    ::reepat::repeat
    ::reepated::repeated
    ::reepatedly::repeatedly
    ::repetaedly::repeatedly
    ::reepats::repeats
    ::repeelm::repelem              ; common MATLAB function
    ::repetitve::repetitive
    :*:repalce::replace             ; replace/s/d/ment/able
    :*:replcia::replica             ; replica/s/te/tion
    :*:repliac::replica
    ::repamt::repmat                ; common MATLAB function
    :*:reoprt::report               ; report/s/ed/er/ing
    ::repostiroies::repositories
    ::repositoroies::repositories
    ::reposistories::repositories
    ::reopsitories::repositories
    ::repositroies::repositories
    ::repostiories::repositories
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
    ::requirment::requirement
    ::rquirment::requirement
    ::requirments::requirements
    ::rquirments::requirements
    ::requies::requires
    ::requirse::requires
    ::resaerch::research
    ::reserach::research
    ::resarch::research
    ::rserve::reserve
    ::resrve::reserve
    ::rserved::reserved
    ::resrved::reserved
    ::rserves::reserves
    ::resrves::reserves
    ::reisde::reside
    ::reisded::resided
    ::reisdes::resides
    ::reislient::resilient
    ::reoslution::resolution
    ::reoslutions::resolutions
    :*:reoslve::resolve             ; resolve/d/r/s
    ::resoruce::resource
    ::reosurce::resource
    ::resoruces::resources
    ::reosurces::resources
    ::respodn::respond
    ::resopnd::respond
    ::resopnded::responded
    ::resopnder::responder
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
    ::reults::results
    ::resuem::resume
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
    :*:reeturn::return
    ::reurn::return
    :*:retur n::return `            ; ex: 'retur ntrue' (` used to add trailing space)
    ::returnd::returned
    ::returend::returned
    ::revesre::reverse
    ::reivew::review
    ::reveiw::review
    ::reivewed::reviewed
    ::reveiwed::reviewed
    ::reivewer::reviewer
    ::reveiwer::reviewer
    ::reivews::reviews
    ::reveiws::reviews
    ::reivsion::revision
    ::reivsions::revisions
    :*:reviist::revisit             ; revisit/s/ed/ing
    :*:reawrd::reward               ; reward/s/ed/ing
    ::rewriet::rewrite              ; COBOL statement
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
    ::saef::safe
    ::sfaer::safer
    ::saefr::safer
    ::sfaest::safest
    ::saefst::safest
    ::sfaety::safety
    ::saefty::safety
    ::saem::same
    ::smae::same
    ::sampel::sample
    ::sampeld::sampled
    ::sampels::samples
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
    ::shcema::schema
    ::schmea::schema
    ::scroe::score
    ::scroes::scores
    :*:scritp::script               ; script/s/ed/ing
    :*:sript::script
    :*:sritp::script
    :*:scirpt::script
    :*:serach::search               ; search/ed/es/ing
    :*:saerch::search
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
    :*:seperat::separat             ; separate, separation, separator
    ::seprate::separate
    ::seprated::separated
    ::seprates::separates
    :*:seuqen::sequen               ; sequen/ce/cing/tial
    :*:seuenc::sequenc
    ::seuqnce::sequence
    ::seuqnces::sequences
    ::serliase::serialise
    ::serliased::serialised
    ::serliases::serialises
    ::serliaze::serialize
    ::serliazed::serialized
    ::serliazes::serializes
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
    ::srevice::service
    ::ersvice::service
    ::serivces::services
    ::esrvices::services
    ::srevices::services
    ::ersvices::services
    ::setapram::setparam            ; Kotlin soft keyword
    :C:setTimeotu::setTimeout       ; JavaScript function
    ::serverity::severity
    :*:shaodw::shadow               ; shadow/s/ed/ing
    ::shaep::shape
    ::shaepd::shaped
    ::shaeps::shapes
    :*:hsard::shard                 ; shard/s/ed/ing
    ::sahred::shared
    ::hsared::shared
    ::shaerd::shared
    ::shrot::short
    ::shrotcut::shortcut
    ::shortctu::shortcut
    ::shortctus::shortcuts
    ::shrotest::shortest
    ::shrots::shorts
    ::shoud::should
    ::shoudl::should
    ::hsould::should
    ::shuld::should
    ::shoudn't::shouldn't
    ::shoudln't::shouldn't
    ::hsouldn't::shouldn't
    ::shuldn't::shouldn't
    ::hsow::show
    ::hsowed::showed
    ::hsowing::showing
    ::hsows::shows
    ::shirnk::shrink
    ::shirnking::shrinking
    ::shirnks::shrinks
    :*:signla::signal               ; signal/s/ed/er/ing
    ::significnat::significant
    ::ismilar::similar
    ::simlar::similar
    ::similarty::similarity
    ::simlarity::similarity
    ::simulatenous::simultaneous
    ::signle::single
    ::singel::single
    ::singluar::singular
    ::siez::size
    :C:isze::size
    ::sie of::size of
    :C:sie_t::size_t                ; common C++ data type
    :C:sizet::size_t
    :C:size_T::size_t
    :C:size-t::size_t
    ::iszed::sized
    ::sieof::sizeof
    ::siezs::sizes
    ::iszes::sizes
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
    ::soltions::solutions
    ::sovlable::solvable
    :*:sovle::solve                 ; solve/s/d/r/rs
    ::smoe::some
    ::osme::some
    :C:soem::some
    ::somehing::something
    ::smoething::something
    ::osmething::something
    ::somehting::something
    ::osmetime::sometime
    ::osmetimes::sometimes
    :*:srot::sort                   ; sort/s/ed/ing/able
    :*:osrt::sort
    :C:SOrt::Sort
    :*:sorrt::sort
    ::soretd::sorted
    ::soruce::source
    ::soruces::sources
    ::spawsn::spawns
    ::sproadic::sporadic
    ::sproadically::sporadically
    ::spraed::spread
    ::spraeds::spreads
    ::spraedsheet::spreadsheet
    ::spraedsheets::spreadsheets
    ::spritnf::sprintf              ; common string formatting function
    ::sqltie::sqlite
    ::slqite::sqlite
    ::sqltie3::sqlite3
    ::slqite3::sqlite3
    ::squre::square
    ::squred::squared
    ::squres::squares
    ::stabel::stable
    :*:stakc::stack                 ; stack/s/ed/ing/able
    :*:satck::stack
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
    ::stokc::stock
    :C:sotp::stop
    ::sotps::stops
    ::stoarge::storage
    ::stoage::storage
    ::stroe::store
    ::tsore::store
    ::tsored::stored
    ::stroes::stores
    ::tsores::stores
    ::streategy::strategy
    ::strema::stream
    ::stremaing::streaming
    ::stremas::streams
    ::strenghten::strengthen
    :*:sring::string                ; ex: string/s/ent/ify
    :*:stirng::string
    :*:tsring::string
    :C:STring::String
    ::storng::strong
    ::stornger::stronger
    ::stuct::struct
    ::strcut::struct
    :*:strutur::structur            ; structur/e/ed/al/es
    :*:structcur::structur
    :*:strucutr::structur
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
    ::submoduel::submodule
    ::submoduels::submodules
    :*:subcribe::subscribe          ; subscribe/d/r/s
    ::subscribesr::subscribers
    ::subscritp::subscript          ; Swift keyword
    ::subscirpt::subscript
    ::subseuqent::subsequent
    ::subsequenet::subsequent
    ::subseuqently::subsequently
    ::subsequenetly::subsequently
    ::usbset::subset
    ::usbsets::subsets
    ::substitue::substitute
    ::substittue::substitute
    ::substtitue::substitute
    ::subsring::substring
    ::substirng::substring
    ::subsstring::substring
    ::subsrings::substrings
    ::substirngs::substrings
    ::subsstrings::substrings
    ::subract::subtract
    ::subracted::subtracted
    ::subracts::subtracts
    :*:suceed::succeed              ; succeed/s/ed/ing
    :*:sucess::success              ; success/ful/fully/or/ive
    ::succes::success
    ::successfuly::successfully
    ::succesfully::successfully
    ::succesor::successor
    ::usch::such
    ::suggets::suggest
    ::sutie::suite                  ; test suite
    ::suties::suites
    :*:suepr::super                 ; super/class/script/sede/vised
    ::superscritp::superscript
    ::superscirpt::superscript
    ::superivsed::supervised
    ::superivses::supervises
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
    ::sysem::system
    ::sysems::systems

    ::tabel::table
    ::tabels::tables
    ::tkae::take
    ::tkaen::taken
    ::taks::task
    ::taksed::tasked
    ::takss::tasks
    :*:tehcn::techn                 ; technology, technical, technique
    ::techincal::technical
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
    ::temrinals::terminals
    ::termiante::terminate
    ::termianted::terminated
    ::termiantes::terminates
    ::tetsing::testing
    ::textula::textual
    ::texutal::textual
    ::htan::than
    ::tahn::than
    ::thna::than
    ::htat::that
    ::taht::that
    ::thta::that
    :C:THat::That
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
    :C:THen::Then
    ::theorme::theorem
    ::theormes::theorems
    ::htere::there
    ::tehre::there
    :C:THere::There
    ::therfore::therefore
    ::htese::these
    ::thees::these
    ::tehse::these
    :C:THese::These
    ::htey::they
    ::thye::they
    ::htye::they
    :C:THey::They
    ::theyr'e::they're
    ::hting::thing
    ::htings::things
    ::thikning::thinking
    ::htird::third
    ::thidr::third
    ::thsi::this
    ::htis::this
    ::tihs::this
    :C:THis::This
    ::thsoe::those
    ::htose::those
    :C:THose::Those
    :*:thoguht::thought             ; thought/s/ful/fully
    ::thrad::thread
    ::htread::thread
    ::thrading::threading
    ::htreading::threading
    ::thrads::threads
    ::htreads::threads
    ::thershold::threshold
    ::throuhg::through
    ::thorw::throw
    ::htrow::throw
    ::thorwn::thrown
    ::htrown::thrown
    ::thorws::throws
    ::htrows::throws
    ::tiel::tile
    ::tield::tiled
    ::tiels::tiles
    ::timeotu::timeout
    ::tiemout::timeout
    ::timeotus::timeouts
    ::tiemouts::timeouts
    ::tiemstamp::timestamp
    ::tiemstamps::timestamps
    :C:ot a::to a
    :C:ot an::to an
    ::ot be::to be
    ::t obe::to be
    ::ot call::to call
    ::ot do::to do
    ::ot find::to find
    ::ot get::to get
    ::ot give::to give
    ::ot go::to go
    ::ot have::to have
    ::ot know::to know
    ::ot make::to make
    ::ot put::to put
    ::ot see::to see
    ::ot set::to set
    ::ot take::to take
    ::ot that::to that
    ::ot the::to the
    ::to th::to the
    ::tothe::to the
    ::t othe::to the
    ::ot them::to them
    ::ot these::to these
    ::ot this::to this
    ::ot those::to those
    ::ot try::to try
    ::ot use::to use
    ::ot work::to work
    ::todya::today
    ::tdoay::today
    ::togehter::together
    :*:toekn::token                 ; token/s/ise/izer/isation
    :*:otekn::token
    ::tolerence::tolerance
    ::tolernace::tolerance
    ::toelrance::tolerance
    ::tolerences::tolerances
    ::tolernaces::tolerances
    ::toelrances::tolerances
    ::toolsrip::toolstrip
    ::toplogical::topological
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
    ::trillino::trillion
    ::trillinos::trillions
    ::ture::true
    :C:TRue::True
    ::trucate::truncate
    ::trucated::truncated
    ::trucates::truncates
    ::tuend::tuned
    ::tuens::tunes
    ::tupel::tuple
    ::tyep::type
    ::tyepalias::typealias          ; Swift keyword
    ::tyepdef::typedef
    ::typenaem::typename
    ::tyepof::typeof
    ::tyeps::types
    ::tpyical::typical
    ::tpyically::typically

    ::undfeined::undefined
    ::undefiend::undefined
    ::udnerstand::understand
    ::udnerstands::understands
    ::uniofrmly::uniformly
    ::uniformotuput::uniformoutput  ; MATLAB name/value pair
    ::unoin::union
    ::uniqeu::unique
    ::unqiue::unique
    ::uniuqe::unique
    ::uniqe::unique
    ::uinque::unique
    ::uniqeuly::uniquely
    ::unqiuely::uniquely
    ::uniuqely::uniquely
    ::uinquely::uniquely
    ::uniqely::uniquely
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
    ::udpate::update
    ::upadte::update
    ::updadte::update
    ::udpated::updated
    ::upadted::updated
    ::updadted::updated
    ::udpater::updater
    ::upadter::updater
    ::updadter::updater
    ::udpates::updates
    ::upadtes::updates
    ::updadtes::updates
    ::upsream::upstream
    ::uesd::used
    ::used ot::used to
    ::uesr::user
    ::uesrs::users
    ::uinsg::using

    ::vacnat::vacant
    ::vlaid::valid
    ::avlid::valid
    ::vlaidate::validate
    ::avlidate::validate
    ::vlaidates::validates
    ::avlidates::validates
    ::valueable::valuable
    ::vlaue::value
    ::avlue::value
    ::vluae::value
    ::valeu::value
    ::vlue::value
    ::vlaued::valued
    ::avlued::valued
    ::vluaed::valued
    ::valeud::valued
    ::vlued::valued
    ::vlaues::values
    ::avlues::values
    ::vluaes::values
    ::valeus::values
    ::vlues::values
    ::vareiable::variable
    ::varibale::variable
    ::varible::variable
    ::varaible::variable
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
    ::vetors::vectors
    ::vecotrs::vectors
    ::vetcors::vectors
    ::vecctors::vectors
    ::vctors::vectors
    ::vectcors::vectors
    ::veirfy::verify
    ::vierfy::verify
    ::verifiy::verify
    ::veriyf::verify
    ::vesrion::version
    ::vesrioning::versioning
    ::vesrions::versions
    ::vetex::vertex
    ::veritcal::vertical
    ::veritical::vertical
    ::vrey::very
    ::vidoe::video
    ::vidoes::videos
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
    :*:viist::visit                 ; visit/s, visitor/s
    :*:viusal::visual               ; visual/s/ly/ise/ize/ized/ization
    :*:visula::visual
    :C:VIsual::Visual               ; Visual Studio
    ::visualiation::visualization
    ::visualiations::visualizations
    ::vodi::void                    ; C data type
    ::viod::void

    ::wiat::wait
    ::wiated::waited
    ::wiating::waiting
    ::wiats::waits
    ::wkae::wake
    ::watn::want
    ::wnat::want
    ::wnated::wanted
    ::watns::wants
    ::wnats::wants
    ::wanring::warning
    :C:wsa::was
    :C:WAs::Was
    ::wa snot::was not
    ::wans't::wasn't
    ::wan't::wasn't
    ::wasnt'::wasn't
    :*:wtach::watch                 ; watch/ed/es/dog/point
    :*:wieght::weight               ; weight/s/ed/ing
    ::wern't::weren't
    ::werent'::weren't
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
    ::wher ethe::where the
    ::wher eyou::where you
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
    :*:whtie::white                 ; whiteboard, whitelist, whitespace
    ::whitelsit::whitelist
    ::whitelsited::whitelisted
    ::whitelsits::whitelists
    :C:WHo::Who
    ::whoel::whole
    :C:WHy::Why
    ::iwdth::width
    ::iwdths::widths
    :*:winowd::window               ; window/s/ed/ing
    :*:winodw::window
    ::iwth::with
    ::wiht::with
    ::wtih::with
    :C:WIth::With
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
    ::workaorund::workaround
    ::workflwo::workflow
    ::worht::worth
    ::woudl::would
    ::wouldnt'::wouldn't
    ::woudln't::wouldn't
    :*:wirte::write                 ; writer, Write-Output
    :*:wriet::write
    :*:wrtie::write
    ::wirtten::written

    ::yaer::year
    :*:yeidl::yield                 ; yield/s/ed/ing
    :*:yeild::yield
    :C:yuo::you
    :C:Yuo::You
    :C:YOu::You
    :*:yoru::your                   ; your, yours, yourself
    ::youself::yourself

    :C:zeor::zero
    :C:zeors::zeros

    ; SUFFIX LIST
    ; Autocorrect words which have these endings.
    ; Useful suffix dictionary search tool: https://www.litscape.com/word_tools/ends_with.php)

    :C?:albe::able        ; ex: available, mutable, scalable, readable, variable
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
    :C?:allly::ally       ; ex: automatically, finally, optionally, sporadically, computationally
    :C?:alyl::ally
    :C?:aenous::aneous    ; ex: simultaneous, extraneous, instantaneous, miscellaneous, spontaneous
    :C?:raed::ared        ; ex: shared, declared, prepared, compared, cleared
    :C?:raes::ares        ; ex: shares, declares, prepares, compares, squares
    :C?:airty::arity      ; ex: parity, modularity, similarity, linearity, popularity
    :C?:iarty::arity
    :C?:aesd::ased        ; ex: erased, based, increased, released, leased, aliased, chased
    :C?:aesr::aser        ; ex: eraser, increaser, releaser, purchaser, chaser
    :C?:aesrs::asers
    :C?:athc::atch        ; ex: catch, batch, match, watch, dispatch
    :C?:aetd::ated        ; ex: emulated, obfuscated, encapsulated, updated, automated, related
    :C?:taed::ated
    :C?:taion::ation      ; ex: application, optimization, relation, mutation, replication
    :C?:taoin::ation
    :C?:taions::ations
    :C?:taoins::ations
    :C?:atie::ative       ; ex: native, collaborative, alternative, iterative, generative
    :C?:taive::ative
    :C?:atro::ator        ; ex: generator, emulator, operator, iterator, numerator, authenticator
    :C?:atros::ators
    :C?:bakc::back        ; ex: callback, playback, fallback, rollback, feedback
    :C?:bakcs::backs
    :C?:bilties::bilities ; ex: abilities, probabilities, availabilities, possibilities, capabilities
    :C?:blities::bilities
    :C?:bilites::bilities
    :C?:blites::bilities
    :C?:bilty::bility     ; ex: scalability, ability, mutability, probability, stability, visibility
    :C?:blity::bility
    :C?:ilbity::bility
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
    :C?:hced::ched        ; ex: cached, fetched, glitched, batched, searched, launched
    :C?:hcer::cher        ; ex: cacher, fetcher, batcher, searcher, launcher
    :C?:hcers::chers
    :C?:hcing::ching      ; ex: caching, matching, touching, watching, launching
    :C?:hicng::ching
    :C?:ctiy::city        ; ex: capacity, opacity, scarcity, atomicity, multiplicity
    :C?:ciyt::city
    :C?:kced::cked        ; ex: locked, unlocked, picked, stacked, checked, clicked, tracked
    :C?:kcer::cker        ; ex: locker, unlocker, picker, stacker, checker, clicker, tracker
    :C?:kcers::ckers
    :C?:kcet::cket        ; ex: ticket, packet, socket, bracket, racket
    :C?:kcets::ckets
    :C?:kcing::cking      ; ex: locking, tracking, networking, blocking, benchmarking, stacking
    :C?:daet::date        ; ex: update, validate, invalidate, mandate, candidate
    :C?:daets::dates
    :C?:denet::dent       ; ex: independent, descendent, dependent, indent, descendent
    :C?:dnet::dent
    :C?:dres::ders        ; ex: encoders, transponders, leaders, providers, readers
    :C?:idng::ding        ; ex: offloading, finding, padding, coding, encoding, building
    :C?:idngs::dings
    :C?:idtion::dition    ; ex: addition, condition, edition, tradition, precondition
    :C?:idtions::ditions
    :C?:donw::down        ; ex: down, markdown, shutdown, slowdown, teardown
    :C?:odwn::down
    :C?:aech::each        ; ex: each, reach, teach, breach, foreach
    :C?:leing::eling      ; ex: traveling, leveling, labeling, canceling, modeling
    :C?:necy::ency        ; ex: adjacency, consistency, frequency, dependency, latency
    :C?:enyc::ency
    :C?:edns::ends        ; ex: appends, extends, intends, suspends, depends, trends
    :C?:oeus::eous        ; ex: simultaneous, miscellaneous, advantageous, erroneous, homogeneous
    :C?:erla::eral        ; ex: general, literal, peripheral, ephemeral, several, numeral
    :C?:erlas::erals
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
    :C?:getn::gent        ; ex: agent, intelligent, tangent, convergent, urgent
    :C?:garphy::graphy    ; ex: cryptography, photography, demography, typography, steganography
    :C?:grahpy::graphy

    :C?:inat::iant        ; ex: variant, invariant, compliant, reliant, covariant
    :C?:aite::iate        ; ex: exponentiate, initiate, instantiate, immediate, associate
    :C?:aites::iates
    :C?:icla::ical        ; ex: topological, canonical, symmetrical, logical, lexical
    :C?:iicent::icient    ; ex: efficient, deficient, coefficient, inefficient, sufficient
    :C?:ietn::ient        ; ex: gradient, quotient, client, transient, recipient, efficient
    :C?:ienet::ient
    :C?:eint::ient
    :C?:eitn::ient
    :C?:eintly::iently    ; ex: efficiently, conveniently, inefficiently, sufficiently, resiliently
    :C?:ietnly::iently
    :C?:ienetly::iently
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
    :C?:igth::ight        ; ex: copyright, height, light, weight, right
    :C?:igths::ights
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
    :C?:iesd::ised        ; ex: equalised, synchronised, amortised, randomised, memorised
    :C?:iesr::iser        ; ex: equaliser, synchroniser, amortiser, randomiser, memoriser
    :C?:iison::ision      ; ex: decision, collision, revision, division, elision
    :C?:iisons::isions
    :C?:iites::ities      ; ex: capabilities, quantities, capacities, probabilities, equalities
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
    :C?:iezr::izer        ; ex: equalizer, synchronizer, amortizer, randomizer, memorizer
    :C?:iezrs::izers
    :C?:alble::lable      ; ex: available, callable, scalable, unscalable, calculable
    :C?:ltiy::lity        ; ex: probability, stability, quality, capability, utility
    :C?:liyt::lity
    :C?:lzie::lize        ; ex: initialize, serialize, visualize, normalize, utilize
    :C?:lelr::ller        ; ex: seller, caller, smaller, controller, teller
    :C?:laod::load        ; ex: overload, download, upload, workload, offload
    :C?:laoded::loaded
    :C?:laoder::loader
    :C?:laods::loads
    :C?:amrk::mark        ; ex: mark, benchmark, bookmark, checkmark, trademark
    :C?:amrked::marked
    :C?:amrks::marks
    :C?:amte::mate        ; ex: approximate, estimate, animate, automate, summate
    :C?:amted::mated
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
    :C?:naion::nation     ; ex: combination, coordination, alternation, concatenation, designation, destination
    :C?:naions::nations
    :C?:nices::ncies      ; ex: dependencies, frequencies, agencies, currencies, latencies, emergencies
    :C?:dned::nded        ; ex: appended, expanded, suspended, rounded, extended, responded
    :C?:dner::nder        ; ex: render, responder, surrender, under, extender
    :C?:dners::nders
    :C?:ntiy::nity        ; ex: infinity, opportunity, sanity, vicinity, unity
    :C?:NOde::Node        ; ex: Node, TreeNode, ListNode, CurrentNode, GraphNode
    :C?:Ndoe::Node
    :C?:tnation::ntation  ; ex: representation, orientation, segmentation, documentation, implementation
    :C?:tnations::ntations
    :C?:tned::nted        ; ex: counted, discounted, mounted, segmented, augmented
    :C?:okcs::ocks        ; ex: locks, clocks, blocks, unlocks, mocks
    :C?:oitn::oint        ; ex: powerpoint, breakpoint, disjoint, watchpoint, checkpoint
    :C?:iont::oint
    :C?:onit::oint
    :C?:oitns::oints
    :C?:ionts::oints
    :C?:onits::oints
    :C?:oend::oned        ; ex: cloned, conditioned, joined, partitioned, functioned
    :C?:roed::ored        ; ex: monitored, stored, factored, explored, refactored
    :C?:soed::osed        ; ex: closed, composed, enclosed, exposed, posed, supposed
    :C?:oudn::ound        ; ex: background, foreground, compound, sound, round
    :C?:oudns::ounds
    :C?:outn::ount        ; ex: count, account, amount, discount, mount
    :C?:outns::ounts
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
    :C?:raeg::rage        ; ex: coverage, average, storage, leverage, overage
    :C?:rnat::rant        ; ex: grant, entrant, reentrant, quadrant, tolerant
    :C?:rnats::rants
    :C?:raet::rate        ; ex: enumerate, migrate, integrate, generate, iterate
    :C?:raets::rates
    :C?:retn::rent        ; ex: apparent, different, parent, inherent, current
    :C?:rila::rial        ; ex: material, adversarial, factorial, combinatorial, serial
    :C?:rtiy::rity        ; ex: security, priority, parity, integrity, modularity
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
    :C?:sihps::ships
    :C?:shpis::ships
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
    :C?:tsed::sted        ; ex: nested, tested, rested, interested, posted, invested, listed
    :C?:setd::sted
    :C?:tsic::stic        ; ex: heuristic, statistic, deterministic, stochastic, characteristic
    :C?:tsics::stics

    :C?:taeg::tage        ; ex: advantage, shortage, outage, stage, percentage
    :C?:atlly::tally      ; ex: horizontally, vertically, digitally, totally, incrementally
    :C?:tnat::tant        ; ex: constant, important, instant, distant, inhabitant
    :C?:tatn::tant
    :C?:tnats::tants
    :C?:tatns::tants
    :C?:thces::tches      ; ex: catches, batches, switches, matches, glitches
    :C?:tley::tely        ; ex: approximately, accurately, remotely, completely, immediately
    :C?:tenet::tent       ; ex: persistent, content, existent, latent, consistent
    :C?:tehr::ther        ; ex: another, either, other, together, gather
    :C?:itfy::tify        ; ex: identify, justify, notify, satisfy, certify
    :C?:ityf::tify
    :C?:itme::time        ; ex: lifetime, realtime, uptime, downtime, runtime
    :C?:tiem::time
    :C?:itmes::times
    :C?:tiems::times
    :C?:tien::tine        ; ex: routine, coroutine, byzantine, subroutine, pristine
    :C?:tiens::tines
    :C?:itng::ting        ; ex: selecting, testing, printing, routing, collecting
    :C?:iton::tion        ; ex: function, exception, condition, transaction, authentication, representation
    :C?:tino::tion
    :C?:toin::tion
    :C?:iotn::tion
    :C?:itno::tion
    :C?:itonal::tional    ; ex: directional, functional, positional, conditional, operational
    :C?:itnoal::tional
    :C?:itons::tions
    :C?:tinos::tions
    :C?:toins::tions
    :C?:iotns::tions
    :C?:tiosn::tions
    :C?:itnos::tions
    :C?:tvie::tive        ; ex: generative, active, relative, effective, primitive
    :C?:otry::tory        ; ex: directory, factory, history, inventory, repository
    :C?:otyr::tory
    :C?:tuer::ture        ; ex: feature, picture, future, structure, capture
    :C?:tuerd::tured
    :C?:tuers::tures
    :C?:ullly::ully       ; ex: successfully, carefully, restfully, watchfully, skillfully
    :C?:ulyl::ully
    :C?:utls::ults        ; ex: results, testResults, defaults, faults, segfaults
    :C?:rued::ured        ; ex: captured, structured, featured, measured, configured, secured
    :C?:tued::uted        ; ex: executed, permuted, contributed, distributed, computed
    :C?:tues::utes        ; ex: executes, attributes, routes, computes, permutes
    :C?:tuion::ution      ; ex: execution, resolution, solution, distribution, contribution
    :C?:tuions::utions
    :C?:avte::vate        ; ex: derivate, private, activate, deactivate, motivate, innovate
    :C?:avted::vated
    :C?:avtes::vates
    :C?:vaets::vates
    :C?:veyr::very        ; ex: very, every, delivery, discovery, recovery
    :C?:verey::very
    :C?:vtiy::vity        ; ex: activity, connectivity, sensitivity, productivity, relativity
    :C?:wrae::ware        ; ex: software, hardware, shareware, firmware, courseware
    :C?:awre::ware
    :C?:hwere::where      ; ex: where, nowhere, somewhere, everywhere, anywhere
    :C?:owrk::work        ; ex: work, network, framework, rework, coursework
    :C?:wokr::work
    :C?:owrks::works
    :C?:wokrs::works
#HotIf
