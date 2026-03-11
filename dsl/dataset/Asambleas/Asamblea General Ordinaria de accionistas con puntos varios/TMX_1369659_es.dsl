law AsambleaGeneralOrdinaria
authority private
enacted 2018-02-01

vocabulary
    verb pay: pay
    verb provide: provide

parties
    Company: Company Corp, legal person
    Shareholders: Shareholders Person, natural person
    BoardPresident: BoardPresident Person, natural person
    BoardSecretary: BoardSecretary Person, natural person
    Commissioner: Commissioner Person, natural person
    Scrutineer: Scrutineer Person, natural person

objects
    FinancialStatements: service
    Dividend: money
    FiscalReport: service
    CommissionerReport: service
    BoardAppointments: service
    Remuneration: money

article 1 Generated
    fact asset ShareholderAssembly is present
    fact certification LegallyConstituted is present
    obligation BoardPresident must provide FinancialStatements to Shareholders.
    obligation Commissioner must provide CommissionerReport to Shareholders.
    rule FinancialStatementsApproval
        If asset ShareholderAssembly is present
        then Shareholders may demand FinancialStatements from Company.
    rule DividendDistribution
        If asset ShareholderAssembly is present
        then Shareholders may demand Dividend from Company.
    rule BoardRatification
        If asset ShareholderAssembly is present
        then Shareholders may provide BoardAppointments to Company.

scenario annual_shareholders_assembly:
    at Assembly installation
    at Financial statements approval
    at Fiscal report approval
    at Commissioner report approval
    at Dividend decree
    at Board ratification
    at Remuneration waiver
    at Assembly closure