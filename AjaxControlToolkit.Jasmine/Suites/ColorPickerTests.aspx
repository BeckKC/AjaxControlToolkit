﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Suites/Suite.Master" AutoEventWireup="true" CodeBehind="ColorPickerTests.aspx.cs" Inherits="AjaxControlToolkit.Jasmine.Suites.ColorPickerTests" %>

<asp:Content ContentPlaceHolderID="TestSuiteName" runat="server">
    ColorPicker
</asp:Content>

<asp:Content ContentPlaceHolderID="TestSuite" runat="server">

    <asp:TextBox runat="server"
        ID="TestTextBox"
        MaxLength="6"
        AutoCompleteType="None"/>

    <act:ColorPickerExtender runat="server"
        TargetControlID="TestTextBox"
        ID="TargetExtender" />

    <script>
        describe("ColorPicker", function() {

            var COLOR_PICKER_EXTENDER_CLIENT_ID = "<%= TargetExtender.ClientID %>";

            var COLOR_PICKER_CONTAINER_CLASS_NAME = "ajax__colorPicker_container",
                COLOR_PICKER_ROW_COUNT = 12,
                COLOR_PICKER_COLUMN_COUNT = 18;

            describe("Rendering", function() {
               
                beforeEach(function() {
                    this.extender = $find(COLOR_PICKER_EXTENDER_CLIENT_ID);

                    this.extender.show();

                    this.$container = $(this.extender._container);
                });

                it("container contains popup div", function() {
                    expect(this.$container.find(COLOR_PICKER_CONTAINER_CLASS_NAME.toClassSelector()).length).toBe(1);
                });

                it("container popup contains table", function() {
                    var $popup = this.$container.find(COLOR_PICKER_CONTAINER_CLASS_NAME.toClassSelector());

                    expect($popup.find("table").length).toBe(1);
                });

                it("table contains proper count of rows and columns", function() {
                    var $colorPickerTable = this.$container.find("table");

                    expect($colorPickerTable.find("tr").length).toBe(COLOR_PICKER_ROW_COUNT);
                    expect($colorPickerTable.find("td").length).toBe(COLOR_PICKER_ROW_COUNT * COLOR_PICKER_COLUMN_COUNT);
                });
            });
        });
    </script>

</asp:Content>