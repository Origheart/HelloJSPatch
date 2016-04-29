

defineClass("ViewController", {
    tableView_heightForRowAtIndexPath: function(tableView, indexPath) {
        return 80
    },
    
    tableView_cellForRowAtIndexPath: function(tableView, indexPath) {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell")
        if (!cell) {
            cell = require('UITableViewCell').alloc().initWithStyle_reuseIdentifier(0, "cell")
        }
        cell.textLabel().setText(self.textForIndex(indexPath));
        cell.textLabel().setNumberOfLines(0);
        var redColor = require('UIColor').cyanColor();
        cell.setBackgroundColor(redColor);
        return cell
    },
            
    tableView_didSelectRowAtIndexPath: function(tableView, indexPath) {
            var row = indexPath.row()
            if (self.dataSource().length > row) {  // 加上判断越界的逻辑
                var content = self.dataSource()[row];
            
            }
        }
    }, {}
);


