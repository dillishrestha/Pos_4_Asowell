﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using NPOI.SS.Formula.Functions;
using OfficeOpenXml.FormulaParsing.ExpressionGraph;
using PdfRpt.Core.Contracts;
using PdfRpt.FluentInterface;
using POS.Entities;
using POS.Entities.CustomEntities;
using POS.Repository.DAL;
using AggregateFunction = PdfRpt.Core.Contracts.AggregateFunction;


namespace POS.Helper.PrintHelper.Report
{
    

    public interface IListPdfReport
    {
        IPdfReportData CreatePdfReport(AdminwsOfAsowell unitofwork, DateTime startime, DateTime endTime, string folderName);

        IPdfReportData CreateDetailsPdfReport(AdminwsOfAsowell unitofwork, DateTime startime, DateTime endTime, string folderName);

        IPdfReportData CreateEntityPdfReport(AdminwsOfAsowell unitofwork, DateTime startime, DateTime endTime, string folderName);

        IPdfReportData CreateMonthPdfReport(AdminwsOfAsowell unitofwork, string folderName);

        IPdfReportData CreateDayPdfReport(AdminwsOfAsowell unitofwork, string folderName);

        IPdfReportData CreateYearPdfReport(AdminwsOfAsowell unitofwork, string folderName);
    }
}