law ActaAsambleaGeneral
authority private
enacted 2018-02-01

vocabulary
    verb transfer: transfer

parties
    Company: Company Corp, legal person
    Shareholder1: Shareholder1 Person, natural person
    Shareholder2: Shareholder2 Person, natural person
    Shareholder3: Shareholder3 Person, natural person

objects
    SharesFixedCapital: movable
    SharesVariableCapital: movable
    ShareCertificates: movable

article 1 Generated
    fact asset MinimumFixedCapital is present
    fact certification LegalAssembly is present
    obligation Company must transfer ShareCertificates to Shareholder1.
    rule CapitalRestructureRule
        If asset MinimumFixedCapital is present
        then Shareholder3 must transfer SharesVariableCapital to Company.
    procedure ShareDonationProcess:
        Shareholder1 transfers SharesFixedCapital to Shareholder3.
    procedure CertificateReissuanceProcess:
        Company transfers ShareCertificates to Shareholder1.