permissionset 50300 "Equipment - Full"
{
    Caption = 'Equipment - Full Access';
    Assignable = true;

    Permissions =
        table Equipment = X,
        tabledata Equipment = RIMD,
        table "Equipment Setup" = X,
        tabledata "Equipment Setup" = RIMD,
        page "Equipment List" = X,
        page "Equipment Card" = X,
        page "Equipment Setup" = X,
        table "Loan Line" = X,
        tabledata "Loan Line" = RIMD,
        table "Loan Header" = X,
        tabledata "Loan Header" = RIMD,
        page "Loan Card" = X,
        page "Loan Subform" = X,
        page "Loan List" = X;
}