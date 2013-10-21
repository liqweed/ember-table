App.EmberTableDynamicBarController = Ember.Controller.extend
  numRows: 100

  init: ->
    setInterval =>
      @get('content').forEach (item) ->
        item.set 'value1', Math.abs(item.get('value1') + (Math.random() * 10 - 5))
        item.set 'value2', Math.abs(item.get('value2') + (Math.random() * 10 - 5))
        item.set 'value3', Math.abs(item.get('value3') + (Math.random() * 10 - 5))
        item.set 'value4', Math.abs(item.get('value4') + (Math.random() * 10 - 5))
        item.set 'value5', Math.abs(item.get('value5') + (Math.random() * 10 - 5))
    , 1500

  columns: Ember.computed ->
    colors  = ['blue', 'teal', 'green', 'yellow', 'orange']
    column1 = Ember.Table.ColumnDefinition.create
      columnWidth:    50
      headerCellName: 'Name'
      contentPath: 'key'
    columns = [1..5].map (number, index) ->
      Ember.Table.ColumnDefinition.create
        color: colors[index]
        headerCellName: 'Bar'
        tableCellViewClass: 'App.EmberTableDynamicBar.BarCell'
        contentPath: "value#{number}"
    columns.unshift(column1)
    columns
  .property()

  content: Ember.computed ->
    [0...@get('numRows')].map (num, index) ->
      Ember.Object.create
        key: index
        value1: Math.random() * 80 + 10
        value2: Math.random() * 80 + 10
        value3: Math.random() * 80 + 10
        value4: Math.random() * 80 + 10
        value5: Math.random() * 80 + 10
  .property 'numRows'
