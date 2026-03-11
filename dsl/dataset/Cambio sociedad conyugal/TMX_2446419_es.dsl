law CódigoCivilPara
authority judicial

vocabulary
    verb transfer: transfer

parties
    Spouse1: Spouse1 Person, natural person
    Spouse2: Spouse2 Person, natural person
    FamilyJudge: FamilyJudge Corp, legal person

objects
    MaritalAssets: movable
    RealEstateAssets: nonmovable
    MaritalDebts: money

article 1 Generated
    fact asset MaritalUnion is present
    fact asset ConjugalPropertyRegime is present
    fact asset ConjugalDomicile is present
    obligation Spouse1 must transfer MaritalAssets to Spouse2.
    obligation Spouse2 must transfer MaritalAssets to Spouse1.
    rule LiquidationRule
        If asset ConjugalPropertyRegime is present
        then Spouse1 must transfer MaritalAssets to Spouse2.