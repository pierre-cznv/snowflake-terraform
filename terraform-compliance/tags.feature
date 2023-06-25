Feature: Check Necessary tags
    Scenario Outline: Ensure that specific tags are correctly defined
        Given I have resource that supports tags defined
        When it has tags
        Then it must contain tags
        Then it must contain "<tags>"
        And its value must match the "<value>" regex

        Examples:
          | tags        | value           |
          | Name        | .+              |
          | Managed-by  | .+              |
          | GDPR        | ^(true\|false)  |
          | Public      | ^(true\|false)  |
          | PCI         | ^(true\|false)  |
          | Tribe       | ^(tribe-data-platform\|tribe-global-platform\|tribe-hardware\|tribe-acquisition\|tribe-lending\|tribe-payments\|tribe-payments-br\|tribe-global-expansion\|tribe-online-payments\|tribe-merchant-success\|tribe-pos\|tribe-pos-lite\|tribe-online-store\|tribe-lending\|tribe-consumer\|tribe-global-bank\|tribe-risk-and-compliance\|tribe-invoices\|tribe-crm-na\|tribe-markets-eu\|tribe-grc-latam)$ |
