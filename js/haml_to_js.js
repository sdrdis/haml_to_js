function escape(str) {
    return String(str)
        .replace(/&/g, '&amp;')
        .replace(/>/g, '&gt;')
        .replace(/</g, '&lt;')
        .replace(/"/g, '&quot;')
}

function attrs(attrs, extended) {
    if (extended) {
      if (extended['class']) {
        if (!attrs['class']) {
          attrs['class'] = '';
        }
        attrs['class'] += extended['class'];
      }
      if (extended['id']) {
        if (!attrs['id']) {
          attrs['id'] = '';
        }
        attrs['id'] = extended['id'] + attrs['id'];
      }
    }
    var buf = []
    for (var key in attrs)
        if (typeof attrs[key] === 'boolean') {
            if (attrs[key] === true)
                buf.push(key + '="' + key + '"')
        } else if ($.isPlainObject(attrs[key]) || $.isArray(attrs[key])) {
            buf.push(key + '="' + escape($.toJSON(attrs[key])) + '"')
        } else if (attrs[key]) {
            buf.push(key + '="' + escape(attrs[key]) + '"')
        }
    return buf.join(' ')
}
