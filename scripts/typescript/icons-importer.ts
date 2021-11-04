import * as fs from 'fs'

console.log('Running assets importer')

const rawDirIcons = '../../priv/static/svgs/icons_new'
const exportDir = '../../lib/moon/helpers'

const getFilesList = () => fs.readdirSync(`${rawDirIcons}`)
const getIconName = (s: string) => s.replace(/([-_])/gi, '_').replace('.svg', '')

type WriteAssetsMapFileProps = {
  files: string[]
}

const writeAssetsMapFile = ({files}: WriteAssetsMapFileProps) => {
  const newFilePath = `${exportDir}/icons.ex`

  fs.writeFileSync(
    newFilePath,
    `defmodule Moon.Helpers.Icons do
  @moduledoc false

  def list_all do
    ~w(
      ${files.sort().map(
        (i) => getIconName(i)
      ).join('\n      ')}
    )
  end
end
`)}

(() => {
  const files = getFilesList()
  writeAssetsMapFile({files})
})()
