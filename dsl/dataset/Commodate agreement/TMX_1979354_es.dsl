law CódigoCivilPara
authority private

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Lender: Lender Corp, legal person
    Borrower: Borrower Corp, legal person

objects
    Property: movable
    DailyFine: money
    ReplacementValue: money

article 1 Generated
    fact asset CommodateRelation is present
    obligation Borrower must transfer Property to Lender.
    obligation Borrower must transfer Property to Lender.
    obligation Borrower must transfer Property to Lender.
    privilege Lender may transfer Property to Borrower.
    prohibition Borrower must not fail Property.
    rule CommodateEstablishment
        If asset CommodateRelation is present
        then Borrower must transfer Property to Lender.
    rule DamageLiability
        If Borrower fails to transfer Property to Lender
        then Borrower must pay ReplacementValue to Lender.
    rule DelayPenalty
        If Borrower fails to transfer Property to Lender
        then Borrower must pay DailyFine to Lender.