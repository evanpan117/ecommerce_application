import React from "react";
import ActionCell from "./ActionCell";

export const productsColumns = [
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
    dataField: "product_quantity",
    text: "Quantity",
    align: "center",
    headerAlign: "center",
    csvFormatter: (cell, row, rowIndex) => cell || "",
    sort: true,
  },
  {
    dataField: "product_description",
    text: "Description",
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
    formatter: (row, original) => <ActionCell original={original} />,
    csvExport: false,
  },
];
