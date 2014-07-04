fs = require 'fs'
async = require 'async'

filepaths = process.argv[2..]

counts = (0 for i in [0..65536])

addCounts = (data, counts) ->
  for i in [0..data.length-1]
    i1 = data[i]
    i1 = 32 if i1 in [9, 10, 13]
    i2 = data[i+1]
    i2 = 32 if i2 in [9, 10, 13]
    index = i1 * 256 + i2
    counts[index] += 1

counts_dict = {}
totalsize = 0
countThem = (path, callback) ->
  fs.readFile path, (err, data) ->
    throw err if err
    addCounts(data, counts)
    totalsize += data.length

    for c, i in counts
      c1 = Math.floor(i / 256)
      c2 = i % 256
      key = String.fromCharCode(c1) + String.fromCharCode(c2)
      counts_dict[key] = c if c > 0

    callback()

report = ->
  result = {
    "books": filepaths.length
    "size": totalsize
    "counts": counts_dict
  }
  console.log(JSON.stringify(result, null, 4))

async.each filepaths, countThem, report

