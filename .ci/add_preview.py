import argparse, re

def addlinedata(addstring, line, mode=0, file_name='README.md'):
  list_of_lines = []
  adding_string = f" {addstring} |"
  with open(file_name, 'r') as r:
    list_of_lines = r.readlines()

  if mode == 0:
    list_of_lines[line] = list_of_lines[line][:-1] + adding_string + '\n'
  elif mode == 1:
    list_of_lines.insert(line, '|' + adding_string+ '\n')

  with open(file_name, 'w') as w:
    w.writelines(list_of_lines)

def titleurl(name='new add', link='----------Url------------'):
  return f"[{name}]({link})"

def imageurl(url='assets/screenshort/gif/------------.gif'):
  return f'<img src="{url}" width="150" height="275">'

def readdata(file_name='README.md'):
  with open('README.md') as r:
    return r.read()

def tabledata(data):
  return re.search(r"^#\sPreview\n([^#]+)", data, re.M).group(1).split("\n")[:-2]

def lastlinestring(data, up=-1):
  return tabledata(data)[up].split('|')[1:-1]

def islastlinecompleted(data):

  lastStringLen = len(lastlinestring(data))
  return True if int(lastStringLen) < 3 else False

def searchline(search, data):
  for line, linedata in enumerate(data.split('\n')):
    if search in linedata:
      return line

def findplace(data):
  lastname = lastlinestring(data, -2)[-1]
  lastimageurl = lastlinestring(data, -1)[-1]

  lastnameline = searchline(lastname, data)
  lastimageline = searchline(lastimageurl, data)

  return (lastnameline, lastimageline)


if __name__ == "__main__":
  parser = argparse.ArgumentParser(
      description='Auto add table content')
  parser.add_argument(
      '-t', type=str, help='Pass title', required=True)
  parser.add_argument(
      '-turl', type=str, help='Title url', required=True)
  parser.add_argument(
      '-i', type=str, help='Image url', required=True)
  parser.add_argument(
      '-p', type=str, help='Path of README.md file', required=True)
  
  args = parser.parse_args()
  data = readdata(args.p)
  lastnameline, lastimageline = findplace(data)

  if islastlinecompleted(data):
    addlinedata(titleurl(name=args.t, link=args.turl), lastnameline)
    addlinedata(imageurl(url=args.i), lastimageline)
  else:
    addlinedata(titleurl(name=args.t, link=args.turl), lastnameline+2, 1)
    addlinedata(imageurl(url=args.i), lastnameline+3, 1)

