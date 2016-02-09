exports.header = null;

exports.footer = {
    height: '1cm',
    contents: function (pageNum, numPages) {
        return "<span style='font-size: small; float: right;'>" + pageNum + "</span>";
    }
};
