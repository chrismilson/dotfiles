function Compress-Data {
    [OutputType([String], [byte])]
    [CmdletBinding(DefaultParameterSetName = 'String')]
    param(
        [Parameter(
            ParameterSetName = 'String',
            Position = 0,
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string]$String,

        [Parameter(
            ParameterSetName = 'String',
            Position = 0,
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [Byte[]]$Data,

        [ValidateSet('String', 'Byte')]
        [String]$As = 'String'
    )

    process {
        if ($PSCmdlet.ParameterSetName -eq 'String') {
            $Data = foreach ($c in $String.ToCharArray()) {
                $c -as [Byte]
            }
        }

        $ms = New-Object IO.MemoryStream
        $cs = New-Object System.IO.Compression.GZipStream(
            $ms, 
            [Io.Compression.CompressionMode]"Compress"
        )

        $cs.Write($Data, 0, $Data.Length)
        $cs.Close()

        if ($As -eq 'Byte') {
            $ms.ToArray()
        }
        elseif ($As -eq 'String') {
            [Convert]::ToBase64String($ms.ToArray())
        }
        $ms.Close()
    }
}

function Expand-Data {
    [OutputType([String], [byte])]
    [CmdletBinding(DefaultParameterSetName = 'String')]
    param(
        [Parameter(
            ParameterSetName = 'String',
            Position = 0,
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string]$String,

        [Parameter(
            ParameterSetName = 'String',
            Position = 0,
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [Byte[]]$Data,

        [ValidateSet('String', 'Byte')]
        [String]$As = 'String'
    )

    process {
        if ($PSCmdlet.ParameterSetName -eq 'String') {
            $Data = foreach ($c in $String.ToCharArray()) {
                $c -as [Byte]
            }
        }

        $ms = New-Object IO.MemoryStream
        $cs = New-Object System.IO.Compression.GZipStream(
            $ms, 
            [Io.Compression.CompressionMode]"Decompress"
        )

        $cs.Write($Data, 0, $Data.Length)
        $cs.Close()

        if ($As -eq 'Byte') {
            $ms.ToArray()
        }
        elseif ($As -eq 'String') {
            [Convert]::ToBase64String($ms.ToArray())
        }
        $ms.Close()
    }
}

function gz {
    [CmdletBinding(DefaultParameterSetName = 'Target')]
    param (
        [Parameter(
            ParameterSetName = 'Target',
            Position = 0,
            Mandatory = $true,
            ValueFromPipelineByPropertyName = $true
        )]
        [string]$Target
    )

    $orig = (Get-Content $Target | Out-String)
    $gzip = Compress-Data $orig -As Byte
    
    $origSize = $orig.Length
    $gzipSize = $gzip.Length

    [string]::Format("orig: {0} B", $origSize)
    [string]::Format("gzip: {0} B ({1:#.##}%)", $gzipSize, 100 * $gzipSize / $origSize)
}