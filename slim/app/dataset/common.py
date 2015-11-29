def like(qry):
    qry_ = qry.replace('%', '\%').replace('_', '\_')
    return '%' + qry_ + '%'
