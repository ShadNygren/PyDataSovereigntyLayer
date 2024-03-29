Feature: Data Access from Different Jurisdictions

  In order to comply with global data protection regulations
  As a PAI system
  I want to ensure that data access requests meet the legal requirements of the jurisdiction in which the data is stored

  Background:
    Given the system knows the jurisdiction of each data item

  Scenario: Accessing data stored in a GDPR-compliant jurisdiction
    Given a user with role "data consumer" requests access to data stored in "EU"
    When the system evaluates the data access request
    Then the system applies GDPR compliance checks to the request
    And the system grants access if the request passes GDPR compliance checks

  Scenario: Accessing data stored in a non-GDPR jurisdiction with no specific data protection laws
    Given a user with role "data consumer" requests access to data stored in "CountryX"
    When the system evaluates the data access request
    Then the system applies the default data access policy to the request
    And the system grants access if the request passes the default policy checks

  Scenario: Denying access to data based on jurisdiction-specific regulations
    Given a user with role "data consumer" requests access to data stored in "California"
    When the system evaluates the data access request
    Then the system applies CCPA compliance checks to the request
    And the system denies access if the request fails CCPA compliance checks

  Scenario: User requests data transfer from GDPR to non-GDPR jurisdiction
    Given a user requests data transfer from "EU" to "CountryX"
    When the system evaluates the data transfer request
    Then the system checks for explicit user consent for the data transfer
    And the system performs an adequacy assessment for "CountryX"
    And the system proceeds with the transfer if it meets GDPR data transfer requirements

  Scenario: Access request from a jurisdiction with data localization laws
    Given a user with role "data consumer" requests access to data stored in "Russia"
    When the system evaluates the data access request
    Then the system checks for compliance with Russian data localization laws
    And the system grants access only if the request is made from within "Russia"
