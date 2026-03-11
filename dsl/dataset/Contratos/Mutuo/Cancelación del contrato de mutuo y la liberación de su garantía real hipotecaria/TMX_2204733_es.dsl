law LoanContract
authority private
enacted 2024-01-11

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Issste: Issste Corp, legal person
    Borrower: Borrower Person, natural person
    TrusteeBank: TrusteeBank Corp, legal person
    Beneficiary: Beneficiary Person, natural person

objects
    LoanAmount: money
    RealEstateLot: nonmovable
    TrustConsideration: money
    AnnualFees: money

article 1 Generated
    fact asset LoanRelation is present
    fact asset MortgageGuarantee is present
    fact asset TrustRelation is present
    fact Borrower owns RealEstateLot
    fact liability LoanDebt is present
    obligation Issste must pay LoanAmount to Borrower.
    obligation Borrower must pay LoanAmount to Issste.
    obligation Borrower must transfer RealEstateLot to TrusteeBank.
    obligation TrusteeBank must transfer RealEstateLot to Beneficiary.
    obligation Beneficiary must pay AnnualFees to TrusteeBank.
    rule TrustTransferRule
        If asset TrustRelation is present
        then TrusteeBank must transfer RealEstateLot to Beneficiary.
    procedure LoanCancellationProcedure:
        Issste pays LoanAmount to Borrower.
    procedure TrustConstitutionProcedure:
        Borrower transfers RealEstateLot to TrusteeBank.
        Beneficiary pays TrustConsideration to Borrower.