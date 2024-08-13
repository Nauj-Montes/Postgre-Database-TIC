import React, { useState } from "react";
import { Card, Avatar, Pagination } from "antd";
import { DollarOutlined, UserOutlined, ShopOutlined } from "@ant-design/icons";
import "../styles/CompanyGrid.css";

const { Meta } = Card;

function CompanyGrid({ companies, onCompanyClick }) {
  const [currentPage, setCurrentPage] = useState(1);
  const companiesPerPage = 12;

  const indexOfLastCompany = currentPage * companiesPerPage;
  const indexOfFirstCompany = indexOfLastCompany - companiesPerPage;
  const currentCompanies = companies.slice(
    indexOfFirstCompany,
    indexOfLastCompany
  );

  const handlePageChange = (page) => {
    setCurrentPage(page);
  };

  const formatRevenue = (revenue) => {
    return new Intl.NumberFormat("en-US", {
      style: "currency",
      currency: "USD",
    }).format(revenue);
  };

  return (
    <div>
      <div className="company-grid">
        {currentCompanies.map((company) => (
          <Card
            key={company.id}
            hoverable
            cover={<Avatar src={company.companyLogo} size={64} />}
            onClick={() => onCompanyClick(company)}
          >
            <Meta
              title={company.companyName}
              description={
                <>
                  <p className="company-industry">
                    <ShopOutlined /> {company.industry}
                  </p>
                  <p>
                    <DollarOutlined /> {formatRevenue(company.companyRevenue)}
                  </p>
                  <hr />
                  <p>
                    <UserOutlined />{" "}
                    {`${company.firstName} ${company.lastName}`}
                  </p>
                </>
              }
            />
          </Card>
        ))}
      </div>
      <div className="pagination-container">
        <Pagination
          current={currentPage}
          pageSize={companiesPerPage}
          total={companies.length}
          onChange={handlePageChange}
        />
      </div>
    </div>
  );
}

export default CompanyGrid;
