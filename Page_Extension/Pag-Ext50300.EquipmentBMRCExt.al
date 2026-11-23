pageextension 50300 "Equipment BM RC Ext" extends "Business Manager Role Center"
{
    actions
    {
        addlast(Sections)
        {
            group(EquipmentSection)
            {
                Caption = 'Equipment';

                action(EquipmentList)
                {
                    ApplicationArea = All;
                    Caption = 'Equipment';
                    RunObject = page "Equipment List";
                    ToolTip = 'Open the list of equipment.';
                }
                action(EquipmentSetupAction)
                {
                    ApplicationArea = All;
                    Caption = 'Equipment Setup';
                    RunObject = page "Equipment Setup";
                    ToolTip = 'Open the equipment setup.';
                }
            }
        }
    }
}