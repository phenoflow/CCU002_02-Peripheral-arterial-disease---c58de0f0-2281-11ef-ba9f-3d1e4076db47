cwlVersion: v1.0
steps:
  read-potential-cases-i2b2:
    run: read-potential-cases-i2b2.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  ccu002_02-peripheral-arterial-disease-pad-associated---primary:
    run: ccu002_02-peripheral-arterial-disease-pad-associated---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-i2b2/output
  ischaemic-ccu002_02-peripheral-arterial-disease-pad---primary:
    run: ischaemic-ccu002_02-peripheral-arterial-disease-pad---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: ccu002_02-peripheral-arterial-disease-pad-associated---primary/output
  ccu002_02-peripheral-arterial-disease-pad-circulatory---primary:
    run: ccu002_02-peripheral-arterial-disease-pad-circulatory---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: ischaemic-ccu002_02-peripheral-arterial-disease-pad---primary/output
  ccu002_02-peripheral-arterial-disease-pad---primary:
    run: ccu002_02-peripheral-arterial-disease-pad---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: ccu002_02-peripheral-arterial-disease-pad-circulatory---primary/output
  diabetic-ccu002_02-peripheral-arterial-disease-pad---primary:
    run: diabetic-ccu002_02-peripheral-arterial-disease-pad---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: ccu002_02-peripheral-arterial-disease-pad---primary/output
  vascular-ccu002_02-peripheral-arterial-disease-pad---primary:
    run: vascular-ccu002_02-peripheral-arterial-disease-pad---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: diabetic-ccu002_02-peripheral-arterial-disease-pad---primary/output
  angiopathy-ccu002_02-peripheral-arterial-disease-pad---primary:
    run: angiopathy-ccu002_02-peripheral-arterial-disease-pad---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: vascular-ccu002_02-peripheral-arterial-disease-pad---primary/output
  ccu002_02-peripheral-arterial-disease-pad-claudication---primary:
    run: ccu002_02-peripheral-arterial-disease-pad-claudication---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: angiopathy-ccu002_02-peripheral-arterial-disease-pad---primary/output
  lower-ccu002_02-peripheral-arterial-disease-pad---primary:
    run: lower-ccu002_02-peripheral-arterial-disease-pad---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: ccu002_02-peripheral-arterial-disease-pad-claudication---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: lower-ccu002_02-peripheral-arterial-disease-pad---primary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
