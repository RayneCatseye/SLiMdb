def like(qry):
    qry_ = qry.replace('%', '=%').replace('_', '=_').replace('[', '=[')
    return '%' + qry_ + '%'
