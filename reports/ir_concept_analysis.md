# IR Concept Reuse Analysis

**Files analyzed:** 369

## Authority

| Authority | Count |
|-----------|-------|
| judicial | 168 |
| private | 167 |
| administrative | 30 |
| legislative | 4 |

## Parties (most reused)

| ID | Count |
|----|-------|
| `plaintiff` | 68 |
| `judge` | 66 |
| `defendant` | 65 |
| `tenant` | 36 |
| `landlord` | 34 |
| `notary` | 28 |
| `buyer` | 27 |
| `seller` | 25 |
| `civil_judge` | 24 |
| `petitioner` | 18 |
| `guarantor` | 14 |
| `secretary` | 12 |
| `client` | 11 |
| `actor` | 10 |
| `court_secretary` | 9 |
| `cliente` | 9 |
| `deceased` | 8 |
| `executor` | 8 |
| `quejoso` | 8 |
| `juez_distrito` | 8 |
| `demandado` | 8 |
| `service_provider` | 8 |
| `company` | 7 |
| `legal_representative` | 7 |
| `cedente` | 7 |

### Party overlap (in 2+ documents)

| Party ID | Documents |
|----------|-----------|
| `plaintiff` | 68 |
| `judge` | 66 |
| `defendant` | 65 |
| `tenant` | 36 |
| `landlord` | 34 |
| `notary` | 28 |
| `buyer` | 27 |
| `seller` | 25 |
| `civil_judge` | 24 |
| `petitioner` | 18 |
| `guarantor` | 14 |
| `secretary` | 12 |
| `client` | 11 |
| `actor` | 10 |
| `court_secretary` | 9 |

## Objects (most reused)

| ID | Count | Type |
|----|-------|------|
| `property` | 44 | - |
| `monthly_rent` | 37 | - |
| `legal_costs` | 27 | - |
| `confidential_information` | 20 | - |
| `purchase_price` | 18 | - |
| `lease_contract` | 13 | - |
| `professional_fees` | 12 | - |
| `inmueble` | 11 | - |
| `security_deposit` | 10 | - |
| `monthly_payment` | 10 | - |
| `legal_services` | 9 | - |
| `rental_property` | 9 | - |
| `professional_services` | 9 | - |
| `penalty_payment` | 8 | - |
| `penalty_fee` | 8 | - |
| `pena_convencional` | 8 | - |
| `sale_price` | 8 | - |
| `damages` | 7 | - |
| `real_estate_property` | 7 | - |
| `case_file` | 7 | - |
| `immovable_property` | 7 | - |
| `deposit` | 7 | - |
| `penalty_amount` | 7 | - |
| `leased_property` | 6 | - |
| `vehicle` | 6 | - |

### Object types

| Type | Count |
|------|-------|
| nonmovable | 197 |
| money | 504 |
| service | 535 |
| movable | 131 |

### Object overlap (in 2+ documents)

| Object ID | Documents |
|-----------|-----------|
| `property` | 44 |
| `monthly_rent` | 37 |
| `legal_costs` | 27 |
| `confidential_information` | 20 |
| `purchase_price` | 18 |
| `lease_contract` | 13 |
| `professional_fees` | 12 |
| `inmueble` | 11 |
| `security_deposit` | 10 |
| `monthly_payment` | 10 |
| `legal_services` | 9 |
| `rental_property` | 9 |
| `professional_services` | 9 |
| `penalty_payment` | 8 |
| `penalty_fee` | 8 |

## Facts (most reused names)

| Name | Count |
|------|-------|
| `PropertyOwnership` | 49 |
| `LegalCapacity` | 24 |
| `LeaseRelation` | 17 |
| `ServiceContract` | 16 |
| `LeaseContract` | 15 |
| `SaleContract` | 10 |
| `legal_capacity` | 9 |
| `property_ownership` | 7 |
| `RentDebt` | 6 |
| `capacidad_legal` | 6 |
| `ProfessionalLicense` | 6 |
| `lease_relation` | 5 |
| `PropertyPossession` | 5 |
| `PropertyRegistration` | 5 |
| `ContractualRelation` | 5 |
| `ContractRelation` | 5 |
| `TaxCompliance` | 5 |
| `LegalRepresentation` | 4 |
| `LegalStanding` | 4 |
| `NotarialCertification` | 4 |
| `ContratoArrendamiento` | 4 |
| `UnpaidRent` | 4 |
| `sale_contract` | 4 |
| `PropertyTitle` | 4 |
| `legal_capacity_to_contract` | 4 |

### Fact overlap (in 2+ documents)

| Fact Name | Documents |
|-----------|-----------|
| `PropertyOwnership` | 49 |
| `LeaseRelation` | 17 |
| `ServiceContract` | 16 |
| `LeaseContract` | 15 |
| `LegalCapacity` | 14 |
| `SaleContract` | 10 |
| `legal_capacity` | 7 |
| `property_ownership` | 7 |
| `RentDebt` | 6 |
| `ProfessionalLicense` | 6 |
| `capacidad_legal` | 5 |
| `lease_relation` | 5 |
| `PropertyPossession` | 5 |
| `PropertyRegistration` | 5 |
| `ContractualRelation` | 5 |

## Norm modalities

| Modality | Count |
|----------|-------|
| obligation | 792 |
| privilege | 43 |
| prohibition | 117 |
| claim | 94 |

## Act signatures (most common)

| Actor→Object→Target | Count |
|---------------------|-------|
| `tenant→monthly_rent→landlord` | 64 |
| `seller→property→buyer` | 34 |
| `buyer→purchase_price→seller` | 19 |
| `tenant→property→landlord` | 12 |
| `buyer→sale_price→seller` | 12 |
| `defendant→legal_costs→plaintiff` | 11 |
| `defendant→property→plaintiff` | 11 |
| `cesionario→precio_cesion→cedente` | 10 |
| `borrower→property→lender` | 9 |
| `tenant→personal_data→landlord` | 8 |
| `seller→vehicle→buyer` | 8 |
| `usufructuario→inmueble→` | 8 |
| `landlord→lease_contract→tenant` | 7 |
| `buyer→property→seller` | 7 |
| `contratista→construction_work→propietario` | 7 |
| `profesionista→servicios_administracion→administracion` | 7 |
| `tenant→commercial_property→landlord` | 6 |
| `landlord→property→tenant` | 6 |
| `subarrendatario→monthly_rent→subarrendador` | 6 |
| `cedente→assigned_right→cesionario` | 6 |
| `vendedor→inmueble→comprador` | 6 |
| `recipient→confidential_information→disclosing_company` | 6 |
| `service_provider→confidential_information→client` | 6 |
| `profesionista→confidential_information→empresa` | 6 |
| `tenant→rental_property→landlord` | 6 |

## Rule condition patterns

| Condition | Count |
|-----------|-------|
| `counter` | 196 |
| `?` | 172 |
| `simple` | 106 |
| `asset:ServiceContract` | 31 |
| `asset:LeaseRelation` | 26 |
| `asset:LeaseContract` | 16 |
| `ownership:PropertyOwnership` | 13 |
| `asset:SaleContract` | 13 |
| `asset:ContractRelation` | 12 |
| `asset:service_contract` | 10 |
| `asset:ContractualRelation` | 7 |
| `asset:cessation_contract_relation` | 6 |
| `asset:SubleaseRelation` | 5 |
| `asset:service_contract_relation` | 5 |
| `asset:SocietyConstitution` | 4 |
| `asset:ShareholderAssembly` | 4 |
| `asset:ComodatoRelation` | 4 |
| `asset:PromiseContract` | 4 |
| `asset:LoanRelation` | 4 |
| `asset:LifeAnnuityContract` | 4 |

## Rule consequence patterns

| Consequence | Count |
|-------------|-------|
| `?(→→)` | 265 |
| `obligation(→→)` | 80 |
| `privilege(→→)` | 12 |
| `obligation(tenant→monthly_rent→landlord)` | 10 |
| `obligation(guarantor→monthly_rent→landlord)` | 7 |
| `obligation(buyer→purchase_price→seller)` | 6 |
| `claim(→→)` | 4 |
| `obligation(tenant→penalty_payment→landlord)` | 4 |
| `prohibition(→→)` | 4 |
| `obligation(seller→property→buyer)` | 4 |
| `obligation(tenant→property→landlord)` | 3 |
| `obligation(notary→payment_identification→regulatory_authority)` | 3 |
| `obligation(appearing_person→personal_data→notary)` | 3 |
| `obligation(cesionario→precio_cesion→cedente)` | 3 |
| `obligation(tenant→money→landlord)` | 3 |
| `obligation(tenant→penalty_fee→landlord)` | 3 |
| `claim(landlord→leased_property→tenant)` | 3 |
| `obligation(buyer→penalty_fee→seller)` | 3 |
| `obligation(tenant→rental_property→landlord)` | 3 |
| `obligation(members→membership_fees→religious_association)` | 2 |