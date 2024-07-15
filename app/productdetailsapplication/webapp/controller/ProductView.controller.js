sap.ui.define([
    "sap/ui/core/mvc/Controller",
    "sap/ui/model/odata/v2/ODataModel",
    "sap/m/MessageBox",
    "sap/ui/core/Fragment"

],
function (Controller, ODataModel,MessageBox,Fragment) {
    "use strict";
    var that;
    return Controller.extend("com.productdetailsapplication.productdetailsapplication.controller.ProductView", {
        
        onInit: function () {
          //  var oModel = new ODataModel("/odata/v2/catalog/");
           // this.getView().setModel(oModel);
            this.loadData();
             that = this;
        },
    // -----------  reading properties from product entity---------------
        loadData: function () {
            var that = this;
            var oModel = that.getOwnerComponent().getModel("oModel") //this.getView().getModel();

            oModel.read("/products", {
                success: function (oData) {
                    var jsonModel = new sap.ui.model.json.JSONModel();
                    jsonModel.setData({
                        Products: oData.results 
                    });
                    that.getView().byId("table").setModel(jsonModel);
                    that.getView().setBusy(false);
                },
                error: function (error) {
                    console.error("Error while loading data:", error);
                    that.getView().setBusy(false);
                }
            });
                // -----------reading properties from characteristics entity-------------
            oModel.read("/Characteristics", {
                urlParameters: {
                    "$expand": "product"
                },
                success: function (oData) {
                    var charJsonModel = new sap.ui.model.json.JSONModel();
                    charJsonModel.setData({
                        Characteristics: oData.results
                    });
                    that.getView().byId("charTable").setModel(charJsonModel);
                    that.getView().setBusy(false);
                },
                error: function (error) {
                    console.error("Error while loading data:", error);
                    that.getView().setBusy(false);
                }
            });
        },
        // onCreateProduct: function () {
        //      // Load the fragment asynchronously
        //      if (!this._oCreateDialog) {
        //         Fragment.load({
        //             id: "createFragmentId",
        //             name: "com.productdetailsapplication.productdetailsapplication.fragmnets.CreateProductFragment",
        //             controller: this // Pass the current controller to the fragment if needed
        //         }).then(function (oFragment) {
        //             that._oCreateDialog = oFragment;
        //             // that.getView().addDependent(that._oCreateDialog);
        //             that._oCreateDialog.open();
        //         });
        //     } else {
        //         this._oCreateDialog.open();
        //     }
        
        // },

        // --------create button fragment------------
        onCreateProduct: function () {
            if (!this._oCreateDialog) {
                this._oCreateDialog = Fragment.load({
                    id: this.getView().getId(),
                    name: "com.productdetailsapplication.productdetailsapplication.fragmnets.CreateProductFragment",
                    controller: this
                }).then(function (oDialog) {
                    this.getView().addDependent(oDialog);
                    return oDialog;
                }.bind(this));
            }
            this._oCreateDialog.then(function (oDialog) {
                oDialog.open();
            });
        },
            //   ----------submit button in create fragment-----------------
        onSubmitCreate: function () {
            var oView = this.getView();
            var oModel = this.getOwnerComponent().getModel("oModel");

            var sProductName = oView.byId("productNameInput").getValue();
            var sCharacteristicName = oView.byId("characteristicNameInput").getValue();
            var sCharacteristicValue = oView.byId("characteristicValueInput").getValue();

            if (sProductName && sCharacteristicName && sCharacteristicValue) {
                // Create product
                oModel.create("/products", { productName: sProductName }, {
                    success: function (oProductData) {
                        // Create characteristic
                        var sProductId = oProductData.ID;
                        var oCharacteristicData = {
                            product_ID: sProductId,
                            characteristicName: sCharacteristicName,
                            characteristicValue: sCharacteristicValue
                        };
                        oModel.create("/Characteristics", oCharacteristicData, {
                            success: function () {
                                MessageBox.success("Product and Characteristics created successfully!");
                                this.loadData();
                                this._oCreateDialog.then(function (oDialog) {
                                    oDialog.close();
                                });
                            }.bind(this),
                            error: function (error) {
                                console.error("Error while creating characteristic:", error);
                            }
                        });
                    }.bind(this),
                    error: function (error) {
                        console.error("Error while creating product:", error);
                    }
                });
            } else {
                MessageBox.error("Please fill all fields.");
            }
        },
        //   -------------cancel button in create fragment-------------------
        onCancelCreate: function () {
            this._oCreateDialog.then(function (oDialog) {
                oDialog.close();
            });
        }
        

    });
});
