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
        page "Equipment Setup" = X;
}