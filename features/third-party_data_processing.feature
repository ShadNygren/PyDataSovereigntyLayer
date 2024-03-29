Feature: Third-party Data Processing

  In order to ensure secure and compliant data handling
  As a PAI system
  I want to manage third-party data processing in accordance with user consent and data protection laws

  Background:
    Given the system is configured to track and manage user consent for data processing

  Scenario: User consents to third-party data processing
    Given a user has opted-in for third-party data processing
    When the system initiates a data processing request to a third-party service
    Then the system includes the user's consent token with the request
    And the third-party service processes the data according to the consent provided

  Scenario: User revokes consent for third-party data processing
    Given a user has previously opted-in but now revokes consent for third-party data processing
    When the system receives the consent revocation
    Then the system updates the consent status for the user
    And the system notifies all active third-party services of the consent revocation

  Scenario: Third-party data processing with explicit data categories
    Given a user consents to third-party processing for specific data categories only
    When the system initiates data processing for those categories
    Then the system ensures only the consented data categories are included in the request
    And the third-party service processes only the data categories permitted by the user

  Scenario: Data processing by a third-party service located in a non-GDPR jurisdiction
    Given a user consents to data processing by a third-party service located outside the EU
    When the system evaluates the third-party service's data protection compliance
    Then the system assesses the adequacy of the third-party's data protection measures
    And if the protection measures are inadequate, the system seeks additional safeguards
    And the system proceeds with data processing only if adequate safeguards are in place

  Scenario: Third-party data processing audit
    Given a scheduled audit of third-party data processing practices is due
    When the system performs the audit
    Then the system reviews the data handling and security practices of third-party services
    And the system verifies compliance with the relevant data protection laws and user consents
    And if non-compliance is found, the system initiates remedial actions

