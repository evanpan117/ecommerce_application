import Centerspinner from "./Centerspinner";
import React from "react";
import BootstrapTable from "react-bootstrap-table-next";
import "react-bootstrap-table-next/dist/react-bootstrap-table2.min.css";
import paginationFactory from "react-bootstrap-table2-paginator";
import ToolkitProvider, {
  Search,
  CSVExport,
} from "react-bootstrap-table2-toolkit";

const { ExportCSVButton } = CSVExport;
const Tablewrapper = (props) => {
  const { columns, heading, data, loading, exportCSV,hideExport }=props
  const { SearchBar } = Search;
  return (
    <div className="Table-wrp">
      <div className="Table-ct">
        <h2 className="text-center">{heading}</h2>
        <ToolkitProvider
          bootstrap4
          keyField="id"
          data={data}
          columns={columns}
          search
          exportCSV={exportCSV || true}
        >
          {(toolkitProps) => (
            <div>
              <div className="float-right">
                <SearchBar {...toolkitProps.searchProps} />

                {!hideExport && (
                  <ExportCSVButton {...toolkitProps.csvProps}>
                    Export CSV
                  </ExportCSVButton>
                )}
              </div>
              {loading ? (
                <Centerspinner />
              ) : (
                <BootstrapTable
                  {...props}
                  tabIndexCell
                  pagination={paginationFactory({
                    sizePerPage: 10,
                  })}
                  {...toolkitProps.baseProps}
                />
              )}
            </div>
          )}
        </ToolkitProvider>
      </div>
    </div>
  );
};
export default Tablewrapper;
