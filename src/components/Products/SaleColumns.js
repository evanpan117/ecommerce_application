import React from "react";
import SaleActionCell from "./SaleAction";
import SalesTotal from './SalesTotal'
export const salesColumn = [
  {
    dataField: "product_id",
    text: "Id",
    align: "center",
    headerAlign: "center",
    sort: true,
    csvFormatter: (cell, row, rowIndex) => cell || "",
  },
  {
    dataField: "product_name",
    text: "Name",
    sort: true,
    csvFormatter: (cell, row, rowIndex) => cell || "",
  },

  {
    dataField: "product_price",
    text: "Price",
    sort: true,
    csvFormatter: (cell, row, rowIndex) => cell || "",
  },
  {
    dataField: "product_description",
    text: "Inventory",
    align: "center",
    headerAlign: "center",
    csvFormatter: (cell, row, rowIndex) => cell || "",
    sort: true,
  },

  {
    dataField: "Action",
    text: "Action",
    align: "center",
    headerAlign: "center",
    formatter: (row, original) => <SaleActionCell original={original} />,
    csvExport: false,
  },

  {
    dataField: "Total",
    text: "Total",
    headerAlign: "center",
    formatter: (row, original) => <SalesTotal original={original} />,
  }
];
