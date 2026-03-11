law ContratoPromesaFideicomiso
authority private
enacted 2024-02-05

vocabulary
    verb pay: pay
    verb provide: provide
    verb transfer: transfer

parties
    PromitenteFideicomitente: PromitenteFideicomitente Corp, legal person
    PromitenteFiduciario: PromitenteFiduciario Person, natural person

objects
    Property: nonmovable
    FideicomisoPermit: service
    EscrituraPublica: service
    PenaltyFee: money

article 1 Generated
    fact PromitenteFideicomitente owns Property
    fact asset PromiseContract is present
    obligation PromitenteFideicomitente must transfer Property to PromitenteFiduciario.
    obligation PromitenteFiduciario must provide FideicomisoPermit to PromitenteFideicomitente.
    obligation PromitenteFiduciario must provide EscrituraPublica to PromitenteFideicomitente.
    rule DelayPenaltyRule
        If PromitenteFideicomitente fails to transfer Property to PromitenteFiduciario
        then PromitenteFiduciario may demand PenaltyFee from PromitenteFideicomitente.
    procedure FideicomisoEstablishment:
        PromitenteFiduciario provides FideicomisoPermit to PromitenteFideicomitente.
        PromitenteFideicomitente performs Inmueble to PromitenteFiduciario.
        PromitenteFiduciario provides EscrituraPublica to PromitenteFideicomitente.