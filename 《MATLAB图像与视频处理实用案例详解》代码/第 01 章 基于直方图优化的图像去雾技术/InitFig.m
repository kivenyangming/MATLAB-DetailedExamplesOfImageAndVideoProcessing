function InitFig(hObject,handles)
axes(handles.axes1); cla; set(gca, 'Color', [0.8039 0.8784 0.9686]);
axes(handles.axes2); cla; axis on; box on; set(gca, 'Color', [0.8039 0.8784 0.9686]);
set(gca, 'XTickLabel', [], 'YTickLabel', [], 'XTick', [], 'YTick', []);
set(handles.textInfo, 'String', ...
    'ͼ��ȥ��ϵͳ����������ͼ����ʾ��Ȼ��ѡ��ȥ���㷨�������Թ۲�ֱ��ͼ�Ա�Ч����');