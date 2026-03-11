law DemandaEjecuciónConvenio
authority judicial
enacted 2024-05-20

vocabulary
    verb pay: pay
    verb transfer: transfer

parties
    Actor: Actor Person, natural person
    Defendant: Defendant Person, natural person
    BeneficiarioAlimentos: BeneficiarioAlimentos Person, natural person

objects
    PensionAlimenticia: money
    BienesAseguramiento: nonmovable
    CostasGastos: money

article 1 Generated
    fact certification ConvenioIja is present
    fact liability ObligacionAlimentaria is present
    obligation Defendant must pay PensionAlimenticia to BeneficiarioAlimentos.
    rule EjecucionConvenioRule
        If certification ConvenioIja is present and Defendant fails to pay PensionAlimenticia to BeneficiarioAlimentos
        then Actor may demand EjecucionJudicial from Tribunal.
    rule AseguramientoRule
        If liability ObligacionAlimentaria is present
        then Actor may demand BienesAseguramiento from Tribunal.
    procedure ViaApremio:
        Actor performs DemandaEjecucion to Tribunal.